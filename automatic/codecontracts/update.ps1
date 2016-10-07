import-module au

. $PSScriptRoot\..\scripts\githubHelper.ps1

function global:au_SearchReplace {
    @{
            'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $releases = getLatestReleases -repoUser "Microsoft" -repoName "CodeContracts" -includePreRelease $true

    $version = $releases.latestStable.Version;
    $url = $releases.latestStable.Assets | select -First 1

    $Latest = @{ URL32 = $url; Version = $version };
    return $Latest;
}

update -ChecksumFor 32
