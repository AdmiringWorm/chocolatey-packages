﻿Import-Module AU

$releases = 'https://github.com/coq/coq/releases/latest'
$softwareName = 'coq*'

$repoInfo = @{
  repoUser = 'coq'
  repoName = 'coq'
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  $releaseNotes = "
## [Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/$($Latest.PackageName.ToLowerInvariant())/Changelog.md)

## Software Release Notes
$($Latest.ReleaseNotes)
"

  Update-Metadata -key "releaseNotes" -value $releaseNotes
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"   = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"            = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*url64(bit)?\s*=\s*)'.*'"    = "`${1}'$($Latest.URL64)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"       = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'"   = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*checksum64\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum64)'"
      "(?i)^(\s*checksumType64\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType64)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $latestRelease = Get-LatestGithubReleases @repoInfo | % latest
  $releaseNotes = $latestRelease.Body.Substring(0, $latestRelease.Body.IndexOf("Distribution"))

  @{
    Version = $latestRelease.Version
    ReleaseNotes = $releaseNotes
    URL32 = $latestRelease.Assets | ? { $_ -match "i686\.exe$" }
    URL64 = $latestRelease.Assets | ? { $_ -match "x86_64\.exe$" }
  }
}

update
