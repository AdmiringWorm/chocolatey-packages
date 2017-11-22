. "$PSScriptRoot\..\nagstamon.install\update.ps1"

$packageName = 'nagstamon.portable'

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL32_p
  $Latest.URL64 = $Latest.URL64_p
  $Latest.FileType = 'zip'
  Get-RemoteFiles -Purge -NoSuffix
}

update -ChecksumFor none
