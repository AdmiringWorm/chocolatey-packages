Import-Module AU

$releases = 'https://www1.qt.io/offline-installers/'

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = $Latest.ChecksumType64 = 'sha512'

  $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.URL64 -Algorithm 'sha512' -Headers @{ 'Accept-Ranges' = 'bytes' }
  if ($Latest.URL32) {
    $Latest.Checksum32 = Get-RemoteChecksum -Url $Latest.URL32 -Algorithm 'sha512'
  }
}

function global:au_SearchReplace {
  @{
    '.\tools\chocolateyInstall.ps1' = @{
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

  Update-Metadata -key 'releaseNotes' -Value $releaseNotes
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'qt-creator.*x86[\-_].*\.exe'
  $versionURL = $download_page.Links | Where-Object href -Match $re | Select-Object -First 1 -expand href
  Write-Host "Version URL: $versionURL"

  $version = $versionURL -split '\/' | Select-Object -Last 1 -Skip 1
  $versionTwoPart = $version -replace '^(\d+\.\d+).*', '$1'
  Write-Host "Version: ${version} ($versionTwoPart)"

  #$url = "https://download.qt.io/official_releases/qtcreator/$versionTwoPart/$version/installer_source/"
  $url = "http://master.qt.io/official_releases/qtcreator/$versionTwoPart/$version/installer_source/"
  Write-Host "Testing url '$url'"
  $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing
  $links = $download_page.links | Where-Object href -Match '^windows' | Select-Object -expand href
  $version = Get-Version $version

  if ($version -ge '6.0.0') {
    $url32 = ''
  }
  else {
    $url32 = ($links -match '(x86|_32)\/$' | Select-Object -First 1 | ForEach-Object { $url + $_ }) +
    'qtcreator.7z'
  }
  $url64 = ($links -match '[x_]64\/$' | Select-Object -First 1 | ForEach-Object { $url + $_ }) + 'qtcreator.7z'

  return @{
    URL32         = $url32
    URL64         = $url64
    Version       = $version
    RemoteVersion = $version
  }
}

update -ChecksumFor none -NoCheckUrl
