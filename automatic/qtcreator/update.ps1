Import-Module AU

$releases = 'https://www1.qt.io/offline-installers/'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*url\s*=\s*)'.*'"            = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*url64(bit)?\s*=\s*)'.*'"    = "`${1}'$($Latest.URL64)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"       = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'"   = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*checksum64\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum64)'"
      "(?i)^(\s*checksumType64\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle

  $releaseNotes = @"
[Software Changelog](http://code.qt.io/cgit/qt-creator/qt-creator.git/plain/dist/changes-$($Latest.RemoteVersion).md)
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/qtcreator/Changelog.md)
"@

  Update-Metadata -key "releaseNotes" -value $releaseNotes
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'qt-creator.*x86\-.*\.exe'
  $versionURL = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $version = $versionURL -split '\/' | select -last 1 -skip 1
  $versionTwoPart = $version -replace "^(\d+\.\d+).*", '$1'

  $url = "https://download.qt.io/official_releases/qtcreator/$versionTwoPart/$version/installer_source/"
  $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing
  $links = $download_page.links | ? href -match '^windows' | select -expand href
  $url32 = ($links -match '(x86|_32)\/$' | select -first 1 | % { $url + $_ }) + "qtcreator.7z"
  $url64 = ($links -match '[x_]64\/$' | select -first 1 | % { $url + $_ }) + "qtcreator.7z"

  return @{
    URL32         = $url32
    URL64         = $url64
    Version       = $version
    RemoteVersion = $version
  }
}

update
