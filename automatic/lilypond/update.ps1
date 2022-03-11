﻿Import-Module AU

$releases = 'http://lilypond.org/windows.html'
$softwareName = 'LilyPond'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_AfterUpdate($Package) {
  $releaseNotes = (
    "[Software Changelog](http://lilypond.org/doc/v$($Latest.RemoteVersion -replace '^([\d]+\.[\d]+).*','$1')/Documentation/changes/index.html)`n" +
    "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/lilypond/Changelog.md)")

  Update-Changelog -useIssueTitle
  Update-Metadata -key 'releaseNotes' -value $releaseNotes
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $verRe = '[-]'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32         = [uri]$url32
    Version       = [version]$version32
    RemoteVersion = [version]$version32
  }
}

update -ChecksumFor none
