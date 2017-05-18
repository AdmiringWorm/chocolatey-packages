﻿Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"
cd $PSScriptRoot

$domain = 'http://www.monogame.net'
$releases = "$domain/downloads/"

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_AfterUpdate {
  Set-DescriptionFromReadme -SkipFirst 1
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleasesUrl)>"
      "(?i)(\s*1\..+)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*" = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*" = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\/monogame[\d\-]+\/$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $domain + $_ }
  $download_page = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $domain + $_ }

  $verRe = '[\/]v?'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32 = $url32
    Version = [version]$version32
    ReleasesUrl = $releasesUrl
  }
}

update -ChecksumFor none
