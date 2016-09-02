param(
    [string]$Name = $null,
    [System.Nullable``1[boolean]]$Force = $null,
    [System.Nullable``1[boolean]]$Push = $null
)
$ErrorActionPreference = "Stop";

pushd $PSScriptRoot;
try {
    ls $PSScriptRoot\scripts\*.ps1 | % { 
        "Loading $_";
        . $_
    }

    If (Test-Path update_vars.ps1) { ./update_vars.ps1 }

    $options = @{
        Timeout = 60
        Push = $false
        Threads = 10
        Force = $false
        GistName = "gist.md"
        GistDir = $null
        GitBranch = "master"
        RepoName = "AdmiringWorm/chocolatey-packages"

        Script = {
            param($Phase, $Info)

            If  ($Phase -ne "END") { return }

            saveRunInfo -Info $Info;
            If (($options.GistDir -ne $null) -and ($options.GistName -ne $null)) {
                saveGist -Options $options -Info $Info;
            }

            If (($options.GitBranch -ne $null)) {
                saveGit -options $options -Info $Info;
            }
        }
    }

    $options = parseEnvironment -values $options;

    If ($Force -ine $null) {
        "Setting Force updated packages to $Force"
        $options.Force = $Force.Value;
    }

    If ($Push -ine $null) {
        "Pushing Packages? $Push"
        $options.Push = $Push.Value;
    }

    printVariables -values $options;


    try {
        pushd "../automatic";
        $ErrorActionPreference = "Continue";
        Update-AUPackages -Name $Name -Options $options | ft -AutoSize
        $global:updateall = Import-Clixml "update_info.xml"

    } finally {
        popd;
    }

    # Uncomment to fail the build on AppVeyor on any package error
    #If ($updateall.error_count.total) { throw "Error during package update" }

} finally {
    popd;
}