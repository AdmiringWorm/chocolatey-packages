﻿Import-Module Chocolatey-AU

$releases = 'https://www.icofx.ro/downloads.html'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*url\s*=\s*)'.*'" = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://www.icofx.ro/' + $_ }

  if ($download_page.Content -match "Version\:\s*(\d+\.[\d\.]+)") {
    $version32 = $Matches[1]
  }

  @{
    URL32 = $url32
    Version = $version32
    PackageName = 'IcoFX'
  }
}

update -ChecksumFor 32
