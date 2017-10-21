. "$PSScriptRoot\..\nagstamon\update.ps1"

$packageName = 'nagstamon.install'

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL32_i
  $Latest.URL64 = $Latest.URL64_i
  $Latest.FileType = 'exe'
  Get-RemoteFiles -Purge -NoSuffix
}

update -ChecksumFor none
