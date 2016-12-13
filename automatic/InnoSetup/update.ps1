$ErrorActionPreference = 'Stop';
import-module au
import-module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$versionDirUrl = 'http://files.jrsoftware.org/is/';

function global:au_BeforeUpdate {
  Remove-Item "$PSScriptRoot\tools\*.msi"

  $Latest.FileName = Get-WebFileName $Latest.URL32 "innosetup-unicode.msi"
  $filePath = "$PSScriptRoot\tools\$($Latest.FileName)"
  Get-WebFile $Latest.URL32 $filePath

  $Latest.ChecksumType32 = 'sha256'
  $Latest.Checksum32 = Get-FileHash -Algorithm $Latest.ChecksumType32 -Path $filePath | % Hash
}

function global:au_SearchReplace {
	@{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(file server\s*)\<.*\>" = "`${1}<$($Latest.Releases)>"
      "(?i)(1\..+)\<.*\>"          = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"          = "`${1} $($Latest.Checksum32)"
    }

		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(`"[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName)`""
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

	return @{ URL32 = $url; Version = $version; ReleaseNotesUrl = $releaseNotes ; Releases = ($versionDirUrl + $versionReleaseDir) }
}

update -ChecksumFor none
