param(
    [Parameter(Mandatory = $true)]
    $Name,
    [ValidateSet('Portable', 'Installer')]
    [string] $Type='Installer'
)
# Original Source: <https://github.com/majkinetor/chocolatey/blob/master/New-Package.ps1>

<#
.SYNOPSIS
    Create a new package from the template
.DESCRIPTION
    This function creates a new package by using the directory _template which contains desired package basic settings.
#>
function New-Package{
    [CmdletBinding()]
    param(
        #Package name
        [string] $Name,

        #Type of the package
        [string] $Type,

        #Github repository in the form username/repository
        [string] $GithubRepository
    )

    if ($Name -eq $null) { throw "Name can't be empty" }
    if (Test-Path $Name) { throw "Package with that name already exists" }
    if (!(Test-Path _template)) { throw "Template for the packages not found" }
    $LowerName = $Name.ToLower()
    cp _template $LowerName -Recurse

    Move-Item "$LowerName/template.nuspec" "$LowerName/$LowerName.nuspec" -Force;
    ../setup/Update-IconUrl.ps1 -Name "$LowerName" -GithubRepository $GithubRepository;
    $nuspec = gc -Encoding utf8 "$LowerName/$LowerName.nuspec";

    Write-Verbose 'Fixing nuspec'
    $nuspec = $nuspec -replace '<id>.+',               "<id>$LowerName</id>"
    $nuspec = $nuspec -replace '<title>.+',            "<id>$Name</id>"
    $nuspec = $nuspec -replace '<packageSourceUrl>.+', "<packageSourceUrl>https://github.com/$GithubRepository/tree/master/automatic/$LowerName</packageSourceUrl>"
    $nuspec | Out-File -Encoding UTF8 "$LowerName\$LowerName.nuspec"

    switch ($Type)
    {
        'Installer' {
            Write-Verbose 'Using installer template'
            rm "$LowerName\tools\chocolateyInstallZip.ps1"
            mv "$LowerName\tools\chocolateyInstallExe.ps1" "$LowerName\tools\chocolateyInstall.ps1"
        }
        'Portable' {
            Write-Verbose 'Using portable template'
            rm "$LowerName\tools\chocolateyInstallExe.ps1"
            mv "$LowerName\tools\chocolateyInstallZip.ps1" "$LowerName\tools\chocolateyInstall.ps1"
        }
    }

    Write-Verbose 'Fixing chocolateyInstall.ps1'
    $installer = gc "$LowerName\tools\chocolateyInstall.ps1"
    $installer = $installer -replace "(?i)(^\s*softwareName\s*=\s*)('.*')", "`$1'$($Name)'"
    $installer -replace "(?i)(^\s*packageName\s*=\s*)('.*')", "`$1'$($LowerName)'" | sc "$LowerName\tools\chocolateyInstall.ps1"
}

New-Package $Name $Type -GithubRepository AdmiringWorm/chocolatey-packages -Verbose
