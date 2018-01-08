. "$PSScriptRoot\..\qnapi\update.ps1"

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL32_P
  $Latest.FileType = $Latest.URL32 -split '\.' | select -last 1
  Get-RemoteFiles -Purge -NoSuffix
}

update -ChecksumFor none
