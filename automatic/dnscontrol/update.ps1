[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://github.com/StackExchange/dnscontrol/releases'
$softwareName = 'dnscontrol*'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle -createNonExistingFile
  $releaseNotes = "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/dnscontrol/Changelog.md)`n`n## Software Changelog" + $Latest.ReleaseNotes
  Update-Metadata -key 'releaseNotes' -value $releaseNotes
}

function global:au_GetLatest {
  [array]$releases = Get-AllGithubReleases -repoUser 'StackExchange' -repoName 'dnscontrol' | select -first 1

  $streams = @{}
  $releases | % {
    if (!($streams.ContainsKey($_.Version.ToString(2)))) {
      $streams.Add($_.Version.ToString(2), @{
          Version      = $_.Version.ToString()
          URL32        = $_.Assets | ? { $_ -match '\.exe$' } | select -first 1
          ReleaseNotes = $_.Body
        })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
