[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

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
  Update-Metadata -key 'releaseNotes' -value $Latest.ReleaseNotes
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
