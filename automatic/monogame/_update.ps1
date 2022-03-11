﻿Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"
cd $PSScriptRoot

$domain = 'https://www.monogame.net'
$releases = "$domain/downloads/"

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $newLicenseUrl = $Package.nuspecXml.package.metadata.licenseUrl -replace 'develop|v[\d]+\.[\d\.]+', "v$($Latest.RemoteVersion)"

  iwr -UseBasicParsing -Uri $($newLicenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  $Package.nuspecXml.package.metadata.licenseUrl = $newLicenseUrl
  $Latest.licenseUrl = $newLicenseUrl

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleasesUrl)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(LICENSE\.txt.*)\<[^\>]*\>"    = "`${1}<$($Latest.LicenseUrl)>"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function addDomainIfNeeded([string]$url, [uri]$oldUrl) {
  return New-Object uri($oldUrl, $url)
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\/monogame[\d\-]+(\-release\/.*|\/?)$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { addDomainIfNeeded $_ $releases }
  $download_page = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { addDomainIfNeeded $_ $releasesUrl }

  $verRe = '[\/]v?'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32         = $url32
    Version       = [version]$version32
    ReleasesUrl   = $releasesUrl
    RemoteVersion = $version32
  }
}

update -ChecksumFor none
