[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://github.com/martinrotter/rssguard/releases'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_AfterUpdate {
  Update-Metadata -key 'releaseNotes' -value "[Software Changelog]($($Latest.ReleaseNotes))
  [Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/rssguard/Changelog.md)"

  Update-Changelog -useIssueTitle
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum(64)?\:).*"       = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '(?<!nowebengine\-)win64\.7z'
  $urls64 = $download_page.Links | ? href -match $re | select -expand href | % { 'https://github.com' + $_ }

  $streams = @{}
  $urls64 | % {
    $verRe = '\/'
    $version = $_ -split "$verRe" | select -last 1 -skip 1
    if ($version -eq "devbuild") { continue } # we ignore the pre-release build
    $version = Get-Version $version

    if (!($streams.ContainsKey($version.ToString(2)))) {
      $streams.Add($version.ToString(2), @{
          Version      = $version.ToString()
          URL64        = $_
          PackageName  = 'RssGuard'
          ReleaseNotes = "https://github.com/martinrotter/rssguard/releases/tag/$($version.ToString())"
        })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
