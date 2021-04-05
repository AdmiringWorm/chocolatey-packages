. "$PSScriptRoot\..\nagstamon\update.ps1"
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$packageName = 'nagstamon.install'

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL32_i
  $Latest.URL64 = $Latest.URL64_i
  $Latest.FileType = 'exe'
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  $releaseNotes = (
    "[Software Changelog]($($Latest.ReleaseNotes))  `n" +
    "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/nagstamon.install/Changelog.md)")

  Update-Metadata -key "releaseNotes" -value $releaseNotes
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}
