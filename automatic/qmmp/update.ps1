param($include)

Import-Module AU

$releases = 'http://qmmp.ylsoftware.com/files/windows/?C=M;O=D'
$softwareName = 'Qt-based Multimedia Player'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $licenseUrl = $Package.nuspecXml.package.metadata.licenseUrl -replace "qmmp-[\d\.]+\/","qmmp-$($Latest.RemoteVersion)/"
  iwr -UseBasicParsing -Uri ($licenseUrl + "?format=raw") -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }
  $Package.nuspecXml.package.metadata.licenseUrl = $licenseUrl

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*" = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*" = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '[\d\.]+\/$'
  $versions = $download_page.Links | ? href -match $re | select -expand href | % { 'http://qmmp.ylsoftware.com/files/windows/' + $_ }

  $streams = @{ }

  $versions | % {
    $version_url = $_
    $urls_page = Invoke-WebRequest -Uri "${version_url}?C=M;O=D" -UseBasicParsing
    $url = $urls_page.Links | ? href -match '\.exe$' | select -first 1 -expand href | % { $version_url + $_ }
    $verRe = '[-]'
    $version = Get-Version ($url -split $verRe | select -last 1 -skip 1)
    $streams.Add($version.ToString(2), @{ URL32 = $url; Version = $version.ToString(); RemoteVersion = $version.ToString() })
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -Include $include
