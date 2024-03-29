﻿Import-Module Chocolatey-AU
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = "https://waveengine.net/Downloads"

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
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
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = "[\d_]+\.exe$"
  $url = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $version = $url -split 'Setup_|\.exe$' | select -last 1 -skip 1 | % { $_ -replace '_','.' }

  $Latest = @{ URL = $url; Version = $version }
  return $Latest;
}

update -ChecksumFor 32
