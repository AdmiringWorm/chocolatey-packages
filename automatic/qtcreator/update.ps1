Import-Module AU

$releases = 'https://www1.qt.io/offline-installers/'
$softwareName = 'qtcreator*'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -FileNameBase "qtcreator"
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleasesLocation)>"
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
  Update-Changelog -useIssueTitle
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'qt-creator.*x86\-.*\.exe$'
  $versionURL = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $version = $versionURL -split '\/' | select -last 1 -skip 1
  $versionTwoPart = $version -replace "^(\d+\.\d+).*", '$1'

  $url = "https://download.qt.io/official_releases/qtcreator/$versionTwoPart/$version/installer_source/"
  $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing
  $links = $download_page.links | ? href -match '^windows' | select -expand href
  $url32 = ($links -match '_32\/$' | select -first 1 | % { $url + $_ }) + "qtcreator.7z"
  $url64 = ($links -match '_64\/$' | select -first 1 | % { $url + $_ }) + "qtcreator.7z"

  return @{
    URL32            = $url32
    URL64            = $url64
    Version          = $version
    ReleasesLocation = $url
  }
}

update -ChecksumFor none
