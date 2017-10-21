import-module au
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

. $PSScriptRoot\..\scripts\githubHelper.ps1

function global:au_SearchReplace {
    @{
            'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_AfterUpdate {
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_GetLatest {
    $releases = getLatestReleases -repoUser "Microsoft" -repoName "CodeContracts" -includePreRelease $true

    $match = [regex]::Match($releases.latest.Name, "v\.([\d\.]+(\-[\da-z\-]+))");
    if ($match.Success) {
      $version = $match.Groups[1];
    } elseif (!$releases.latest.IsPreRelease) {
      $version = $releases.latest.Version;
    }
    $url = $releases.latest.Assets | select -First 1

    $Latest = @{ URL32 = $url; Version = $version; ChecksumType32 = 'sha512' };
    return $Latest;
}

update -ChecksumFor 32 -NoCheckChocoVersion
