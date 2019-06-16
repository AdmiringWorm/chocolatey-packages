Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releasesPart = 'https://tablacus.github.io/'
$releases = "${releasesPart}explorer_en.html"

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $licenseUrl = $Package.nuspecXml.package.metadata.licenseUrl -replace '\/(master|[\d\.]+)\/', "/$($Latest.RemoteVersion)/"

  iwr -UseBasicParsing -Uri $($licenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  $Package.nuspecXml.package.metadata.licenseUrl = $licenseUrl
  $Latest.LicenseUrl = $licenseUrl

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(LICENSE\.txt.*)\<[^\>]*\>"    = "`${1}<$($Latest.LicenseUrl)>"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'te.*\.zip$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $version32 = $url32 -split "\/" | select -last 1 -skip 1

  @{
    URL32         = $url32
    Version       = $version32
    RemoteVersion = $version32
  }
}

update -ChecksumFor none
