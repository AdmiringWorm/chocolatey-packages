import-module au
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = "https://www.kymoto.org/products/inno-script-studio/downloads"
$padUnderVersion = '2.2.3'

function global:au_AfterUpdate {
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
  $url = "https://www.kymoto.org/downloads/ISStudio_Latest.exe"

  $re = "^\s*[\d_]+"
  $version = $download_page.links | ? href -Match "release-history" | ? innerText -Match $re | select -First 1 -ExpandProperty innerText

  $Latest = @{ URL = $url; Version = Get-PaddedVersion $version -OnlyBelowVersion $padUnderVersion -revisionLength 4 }
  return $Latest;
}

try {
  update -ChecksumFor 32
}
catch {
  if ($_ -match 'Could not establish trust relationship') {
    "ignore"
  }
  else { throw $_ }
}
