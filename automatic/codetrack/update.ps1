[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://www.getcodetrack.com/releases.html'
$softwareName = 'codetrack*'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'codetrack.*\.zip$'
  $urls32 = $download_page.Links | ? href -match $re | select -expand href | % { 'https://www.getcodetrack.com/' + $_ }

  $streams = @{}
  $urls32 | % {
    $verRe = 'k_|\.zip$'
    $version = ($_ -split "$verRe" | select -last 1 -skip 1) -replace '_', '.'
    $versionTwoPart = $version -replace '^(\d+\.\d+).*', '$1'

    if (!($streams.ContainsKey($versionTwoPart))) {
      $streams.Add($versionTwoPart, @{
          Version = $version.ToString()
          URL32   = $_
        })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
