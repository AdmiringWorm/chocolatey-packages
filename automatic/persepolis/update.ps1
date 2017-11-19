[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$repoUser = "persepolisdm"
$repoName = "persepolis"

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUri)>"
      "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_AfterUpdate {
  Update-metadata -key "releaseNotes" -value $Latest.ReleaseNotes
}

function global:au_GetLatest {
  [array]$releases = Get-AllGithubReleases -repoUser $repoUser -repoName $repoName

  $streams = @{}
  $releases | % {
    if (!($streams.ContainsKey($_.Version.ToString(2)))) {
      [array]$execs = $_.Assets | ? { $_ -match '\.exe$' }
      if (!($execs.Count -ge 2)) { return ; }

      $streams.Add($_.Version.ToString(2), @{
          Version      = $_.Version.ToString()
          URL32        = $execs | ? { $_ -match '(32bit|X32)' } | select -first 1
          URL64        = $execs | ? { $_ -match '(64bit|X64)' } | select -first 1
          ReleaseNotes = $_.Body
        })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
