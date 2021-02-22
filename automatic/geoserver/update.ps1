Import-Module AU

$releases = "http://geoserver.org/release/stable/"
$softwareName = 'geoserver*'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $licenseUrl = $Package.nuspecXml.package.metadata.LicenseUrl
  $licenseUrl = $licenseUrl -replace 'blob', 'raw' -replace "\/(\d[^\/]|master)\/", "/$($Latest.Version)/"
  iwr -UseBasicParsing -Uri $licenseUrl -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still containts distribution rights"
  }

  Get-RemoteFiles -Purge -NoSuffix
  $Latest.LicenseUrl = $licenseUrl -replace 'raw', 'blob'
  $Package.nuspecXml.package.metadata.LicenseUrl = $Latest.LicenseUrl
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(64)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(obtained from )\<.*\>"        = "`${1}<$($Latest.LicenseUrl)>"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"      = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_AfterUpdate {
  #Update-Metadata -key "licenseUrl" -value $Latest.LicenseUrl
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest $releases -UseBasicParsing

  if ($download_page.Content -match "artifact\s*=\s*[`"][^\d]*([\d\.]+)`"") {
    $version = $Matches[1]
  }

  if ($download_page.Content -match "url\s*=\s*`"([^`"]+)`"") {
    $url = "{0}geoserver-{1}-bin.zip" -f $Matches[1], $version
    if ($url -match "^http://sourceforge") {
      $url = $url -replace "^(http)(://sourceforge)", "`${1}s`${2}"
    }
  }

  @{
    URL32   = $url
    Version = $version
  }
}

update -ChecksumFor none
