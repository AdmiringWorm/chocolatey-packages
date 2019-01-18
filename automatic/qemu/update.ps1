﻿Import-Module AU

$releases = 'https://www.qemu.org/download/#windows'
$softwareName = 'QEMU'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'" = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*url64(bit)?\s*=\s*)'.*'" = "`${1}'$($Latest.URL64)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*checksum64\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum64)'"
      "(?i)^(\s*checksumType64\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType64)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function GetDataFrom($releasesUrl) {
  $download_page = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing

  $url = $download_page.Links | ? href -match "\.exe$" | select -last 1 -expand href | % { $releasesUrl + $_ }
  if($url -match "(\d{4})(\d{2})(\d{2})\.exe$") {
    $version = "$($matches[1]).$($matches[2]).$($matches[3])"

    return @{URL = $url ; Version = $version }
  } else {
    throw "Unable to parse version information from '$releasesUrl'"
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\/w32\/$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href
  $url32Data = GetDataFrom $releasesUrl

  $re = '\/w64\/$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href
  $url64Data = GetDataFrom $releasesUrl

  if ($url32Data.version -ne $url64Data.version) {
    throw "32bit version do not match the 64bit version"
  }
  @{
    URL32 = $url32Data.URL
    URL64 = $url64Data.URL
    Version = $url32Data.version
    PackageName = 'Qemu'
  }
}

update
