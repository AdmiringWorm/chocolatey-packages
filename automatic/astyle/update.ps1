﻿Import-Module AU

$releases = 'https://sourceforge.net/projects/astyle/files/astyle/'

function global:au_BeforeUpdate {
  # Download the latest License, and verify it is still an MIT license
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm $licenseFile }
  iwr -UseBasicParsing -Uri "https://sourceforge.net/p/astyle/code/HEAD/tree/trunk/AStyle/LICENSE.md?format=raw" -OutFile $licenseFile

  $isMITLicense = Get-Content $licenseFile -Encoding UTF8 | ? { $_ -match 'MIT License' }

  if (!$isMITLicense) { throw "License has changed, please update..." }


  Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'astyle(?: |%20)([\d\.]+)\/$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://sourceforge.net' + $_ }
  $download_page = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing

  $re = 'windows\.zip\/download$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $verRe = '_'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32    = $url32
    Version  = $version32
    FileType = 'zip'
  }
}

update -ChecksumFor none
