. "$PSScriptRoot\..\nagstamon.install\update.ps1"

$packageName = 'nagstamon.portable'

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL32_p
  $Latest.URL64 = $Latest.URL64_p

  if (!$Latest.URL64) {
    throw "Missing 64bit URL"
  }

  $Latest.FileType = 'zip'
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  $releaseNotes = (
    "[Software Changelog]($($Latest.ReleaseNotes))  `n" +
    "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/nagstamon.install/Changelog.md)")

  Update-Metadata -key "releaseNotes" -value $releaseNotes
  Invoke-VirusTotalScan $Package
}

update -ChecksumFor none
