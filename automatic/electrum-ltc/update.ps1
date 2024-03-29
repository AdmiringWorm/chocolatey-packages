﻿Import-Module Chocolatey-AU
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://electrum-ltc.org'

function global:au_SearchReplace {
  @{
    ".\$($Latest.PackageName).nuspec" = @{
      "(?i)(^\s*\[Software Changelog\]\().*(\))" = "`${1}https://github.com/pooler/electrum-ltc/blob/$($Latest.RemoteVersion)/RELEASE-NOTES`${2}"
      "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
    }
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  function global:au_BeforeUpdate {
    $content = Get-Content "$PSScriptRoot\..\$($Latest.PackageName).install\Readme.md" -Encoding UTF8 | % { $_ -replace "($($Latest.PackageName))(?:\.install| \(Install\))","`$1" }
    $encoding = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllLines("$PSScriptRoot\Readme.md", $content, $encoding)
  }
}

function global:au_AfterUpdate {
  if (Test-Path 'Changelog.md') { Update-ChangelogVersion -Version $Latest.Version }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re    = 'setup.*\.exe$'
  $url_i = $download_page.links | ? href -match $re | select -First 1 -expand href
  $url_i = $releases + $url_i
  $re    = ".*\.exe$"
  $url_p = $download_page.links | ? { $_.href -match $re -and $_.href -notmatch "setup" -and $_.href -notmatch "portable" } `
    | select -First 1 -expand href
  $url_p = $releases + $url_p

  $version  = $url_i -split '[-]|\.exe' | select -Last 1 -Skip 1

  if ($version -eq 'setup') { $version = $url_i -split '[-]|\.exe' | select -Last 1 -Skip 2 }

  return @{ URL_I = $url_i; URL_P = $url_p; Version = $version; RemoteVersion = $version }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}
