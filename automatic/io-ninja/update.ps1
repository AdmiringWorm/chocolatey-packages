Import-Module Chocolatey-AU

$releases = 'http://ioninja.com/downloads.html'
$softwareName = 'IO Ninja*'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64 -Algorithm $Latest.ChecksumType64
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"   = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"            = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*url64(bit)?\s*=\s*)'.*'"    = "`${1}'$($Latest.URL64)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"       = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'"   = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*checksum64\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum64)'"
      "(?i)^(\s*checksumType64\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType64)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'ioninja.*x86\.msi$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $re = 'ioninja.*amd64\.msi$'
  $url64 = $download_page.links | ? href -match $re | select -first 1 -expand href

  $verRe = 'ninja\-|\-windows'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  $version64 = $url64 -split "$verRe" | select -last 1 -skip 1
  if ($version32 -ne $version64) {
    throw "32bit version do not match the 64bit version"
  }
  @{
    URL32          = $url32 -replace '^http:', 'https:'
    URL64          = $url64 -replace '^http:', 'https:'
    Version        = $version32
    ChecksumType32 = 'sha512'
    ChecksumType64 = 'sha512'
  }
}

# Disabled due to custom logic before calling 'Install-ChocolateyPackage'
update -ChecksumFor none
