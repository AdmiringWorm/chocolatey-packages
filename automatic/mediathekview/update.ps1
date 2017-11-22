Import-Module AU

$releases = 'https://download.mediathekview.de/stabil/'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

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

  $re = 'MediathekView\-[\d\.]+.*\.zip$'
  $url32 = $download_page.Links | ? href -match $re | select -last 1 -expand href | % { $releases + $_ }

  $verRe = '[-]|\.zip'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32       = [uri]$url32
    Version     = [version]$version32
    PackageName = 'MediathekView'
  }
}

update -ChecksumFor none
