Import-Module Chocolatey-AU

$releases = 'https://www.brightfort.com/sbdownload_free.html'
$softwareName = 'SpywareBlaster *'

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha512'
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*url\s*=\s*)'.*'"          = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  if ($download_page.Content -match "Download SpywareBlaster\s*(\d+\.[\d\.]+)\s*Installer") {
    $version32 = $Matches[1]
  }

  @{
    URL32   = $url32 -replace "http:","https:"
    Version = $version32
  }
}

update -ChecksumFor none
