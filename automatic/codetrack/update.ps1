[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://www.getcodetrack.com/releases.html'
$softwareName = 'codetrack*'

function global:au_BeforeUpdate($Package) {

  $content = iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob','raw') | % Content
  $hasMatch = $content | ? { $_ -match 'The Software can be copied and distributed under the condition' }
  if (!$hasMatch) {
    throw "The license has changed. Please verify it still allows distribution"
  }

  Get-RemoteFiles -Purge -NoSuffix
}

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

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

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

  $key = $streams.Keys | sort -Descending
  $streams.Add('latest', $streams[$key])
  $streams.Remove($key)

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
