﻿import-module au

$releases = 'http://abau.org/dilay/download.html'

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }
function global:au_BeforeUpdate($Package) {
  # Download the latest License, and verify it is still an GNU license
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm $licenseFile }
  iwr -UseBasicParsing -Uri ($Package.NuspecXml.package.metadata.licenseUrl -replace 'blob','raw') -OutFile $licenseFile

  $isApacheLicense = Get-Content $licenseFile -Encoding UTF8 | ? { $_ -match 'GNU GENERAL PUBLIC LICENSE' }

  if (!$isApacheLicense) { throw "License has changed, please update..." }

  Get-RemoteFiles -Purge -NoSuffix
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

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.msi$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $verRe = '\/'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32   = $url32
    Version = $version32
  }
}

update -ChecksumFor none
