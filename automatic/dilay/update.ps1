import-module au

. $PSScriptRoot\..\scripts\githubHelper.ps1

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
			"(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
			"(^[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}
	}
}

function global:au_GetLatest {
	$releases = getLatestReleases -repoUser "abau" -repoName "dilay" -includePreRelease $false;

    $version = $releases.latestStable.Version;
    $url = $releases.latestStable.Assets | select -First 1

    $Latest = @{ URL32 = $url; Version = $version };

    return $Latest;
}

update -ChecksumFor 32
