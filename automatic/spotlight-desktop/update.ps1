Import-Module AU

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUrl)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Metadata -key "releaseNotes" -value @"
[Software Changelog]($($Latest.ReleaseNotes))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/spotlight-desktop/Changelog.md)
"@

  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $release = Get-LatestGithubReleases -repoUser 'onlineth' -repoName 'Spotlight-Desktop' | % latest

  $re = '\.msi$'
  $url32 = $release.Assets | ? { $_ -match $re }

  $verRe = '\/'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32        = $url32
    Version      = Get-Version $release.Version
    ReleaseNotes = $release.ReleaseUrl
    ReleaseUrl   = $release.ReleaseUrl
  }
}

update -ChecksumFor none
