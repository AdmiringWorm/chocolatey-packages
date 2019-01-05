﻿Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$releases = 'https://www.kcsoftwares.com/?download'
$softwareName = 'KC Softwares DUMo'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'" = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\dumo.exe"
  Get-WebFile $url32 $dest | Out-Null

  return @{
    URL32 = $url32
    Version = [version](Get-Item $dest | % { $_.VersionInfo.ProductVersion })
    Checksum32 = Get-FileHash $dest -Algorithm SHA512 | % Hash
    ChecksumType32 = 'sha512'
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'dumo.*\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  return Update-OnHeaderChanged -execUrl $url32 -OnHeaderChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 }} -headerName 'last-modified'
}

update -ChecksumFor none
