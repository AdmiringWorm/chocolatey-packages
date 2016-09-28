$ErrorActionPreference = 'Stop';
import-module au

$versionDirUrl = 'http://files.jrsoftware.org/is/';

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
			"(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}
    ".\innosetup.nuspec" = @{
      "(\<releaseNotes\>).*" = "`$1$($Latest.ReleaseNotesUrl)</releaseNotes>"
    }
	}
}

function global:au_GetLatest {
	$versionDirResponse = Invoke-WebRequest -UseBasicParsing -Uri $versionDirUrl;
	$versionReleaseDir = $versionDirResponse.Links | ? href -match "^[0-9]+\/$" | select -Last 1 -ExpandProperty href

	$download_page = Invoke-WebRequest -UseBasicParsing -Uri ($versionDirUrl + $versionReleaseDir)
	$re    = 'innosetup.*unicode\.exe'
	$file   = $download_page.links | ? href -match $re | select -First 1 -expand href
	$url = ($versionDirUrl + $versionReleaseDir + $file)

	$version  = $url -split '[_-]|.exe' | select -Last 1 -Skip 2
  $releaseNotes = "http://www.jrsoftware.org/files/is$($versionReleaseDir.TrimEnd('/'))-whatsnew.htm"

	return @{ URL32 = $url; Version = $version; ReleaseNotesUrl = $releaseNotes }
}

update -NoCheckChocoVersion -Force -ChecksumFor 32
