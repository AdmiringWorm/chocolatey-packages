import-module au

$releases = "https://www.kymoto.org/products/inno-script-studio/downloads"
$padUnderVersion = '2.2.3'

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

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

  $Latest = @{ URL = $url; Version = Get-FixVersion $version -OnlyFixBelowVersion $padUnderVersion }
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
