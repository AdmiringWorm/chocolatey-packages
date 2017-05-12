import-module au
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = "https://waveengine.net/Downloads"

function global:au_AfterUpdate {
  Set-DescriptionFromReadme -SkipFirst 1
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases;

  $re = "WaveEngineSetup_[0-9_]+\.exe";
  $url = $download_page.links | ? href -match $re | select -First 1 -expand href

  $url -match '_([\d_]+)\.' | Out-Null
  $version = $Matches[1] -replace '_','.'

  $Latest = @{ URL = $url; Version = $version }
  return $Latest;
}

update -ChecksumFor 32
