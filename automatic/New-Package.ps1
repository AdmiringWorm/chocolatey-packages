param(
    [Parameter(Mandatory = $true)]
    $Name,
    [ValidateSet('Portable', 'Installer')]
    [string] $Type='Installer',
    [string]$iconUrl = $null,
    [string]$id = $null
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
        [string] $GithubRepository,

        # The url to the icon
        [string]$iconUrl,

        # Optional ID of the package, it will be determined by the Name parameter if none is specified
        [string]$id
    )

    if ($Name -eq $null) { throw "Name can't be empty" }
    if (Test-Path $Name) { throw "Package with that name already exists" }
    if (!(Test-Path _template)) { throw "Template for the packages not found" }
    if (!$id) {
      $id = $Name.ToLower() -replace ' ','-'
    } else {
      $id = $id.ToLower() -replace ' ','-'
    }


    cp _template $id -Recurse

    if ($iconUrl) {
      [System.Net.ServicePointManager]::SecurityProtocol = 3072 -bor
        768 -bor
        [System.Net.SecurityProtocolType]::Tls -bor
        [System.Net.SecurityProtocolType]::Ssl3
      $extension = [System.IO.Path]::GetExtension($iconUrl)
      iwr $iconUrl -OutFile "../icons/${id}${extension}" -UseBasicParsing
    }

    Move-Item "$id/template.nuspec" "$id/$id.nuspec" -Force;
    ../scripts/Update-IconUrl.ps1 -Name "$id" -GithubRepository $GithubRepository -Optimize;
    $nuspec = gc -Encoding utf8 "$id/$id.nuspec";

    Write-Verbose 'Fixing nuspec'
    $nuspec = $nuspec -replace '<id>.+',               "<id>$id</id>"
    $nuspec = $nuspec -replace '<title>.+',            "<title>$Name</title>"
    $nuspec = $nuspec -replace '<packageSourceUrl>.+', "<packageSourceUrl>https://github.com/$GithubRepository/tree/master/automatic/$id</packageSourceUrl>"
    $nuspec | Out-File -Encoding UTF8 "$id\$id.nuspec"

    switch ($Type)
    {
        'Installer' {
            Write-Verbose 'Using installer template'
            rm "$id\tools\chocolateyInstallZip.ps1"
            mv "$id\tools\chocolateyInstallExe.ps1" "$id\tools\chocolateyInstall.ps1"
        }
        'Portable' {
            Write-Verbose 'Using portable template'
            rm "$id\tools\chocolateyInstallExe.ps1"
            mv "$id\tools\chocolateyInstallZip.ps1" "$id\tools\chocolateyInstall.ps1"
        }
    }

    Write-Verbose 'Fixing chocolateyInstall.ps1'
    $installer = gc "$id\tools\chocolateyInstall.ps1"
    $installer = $installer -replace "(?i)(^\s*softwareName\s*=\s*)('.*')", "`$1'$($Name)'"
    $installer -replace "(?i)(^\s*packageName\s*=\s*)('.*')", "`$1'$($id)'" | sc "$id\tools\chocolateyInstall.ps1"
}

New-Package $Name $Type -GithubRepository AdmiringWorm/chocolatey-packages -Verbose -iconUrl $iconUrl -id $id
