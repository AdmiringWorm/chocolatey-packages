﻿Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$softwareName = 'Enki*'
$repoInfo = @{
  repoUser = 'andreikop'
  repoName = 'enki'
}

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle

  Update-Metadata -key "releaseNotes" -value "
  [Software Changelog]($($Latest.ReleaseUrl))
  [Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/enki/Changelog.md)
"
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUrl)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"             = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\)[^`"]*`"" = "`${1}$($Latest.FileName32)`""
    }
  }
}
function global:au_GetLatest {
  $versions = Get-AllGithubReleases @repoInfo | ? { $_.Assets | ? { $_ -match '\.exe$' }} | select -first 2

  $streams = @{}
  $versions | % {
    $version = Get-Version $_.Version

    if (!($streams.ContainsKey($version.ToString(2)))) {
      $streams.Add($version.ToString(2), @{
        Version = $version
        URL32 = $_.Assets | ? { $_ -match '\.exe$' }
        ReleaseUrl = $_.ReleaseUrl
      })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none
