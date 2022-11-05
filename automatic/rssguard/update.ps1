[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_AfterUpdate($Package) {
  Update-Metadata -key 'releaseNotes' -value "[Software Changelog]($($Latest.ReleaseNotes))
  [Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/rssguard/Changelog.md)"

  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
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
  $releases = Get-AllGithubReleases -repoUser 'martinrotter' -repoName 'rssguard'

  $re = '(?<!nowebengine\-)win64\.7z'

  $streams = @{}
  $releases | % {
    if (!$_.Version -or ([string]$_.Version) -eq 'devbuild') {
      return
    }

    $version = Get-Version $_.Version

    $url64 = $_.Assets | ? { $_ -match $re } | select -First 1

    if ($url64 -and !($streams.ContainsKey($version.ToString(2)))) {
      $streams.Add($version.ToString(2), @{
        Version = $version.ToString()
        URL64 = $url64
        PackageName = 'RssGuard'
        ReleaseNotes = $_.ReleaseUrl
      })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
