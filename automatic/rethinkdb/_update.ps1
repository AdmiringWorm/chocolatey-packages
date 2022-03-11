Import-Module AU
Import-Module "$PSScriptRoot/../../scripts/au_extensions.psm1"

$releases = "https://rethinkdb.com/docs/install/windows/"

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $licenseUrl = $Package.nuspecXml.package.metadata.licenseUrl -replace '\/(next|v[\d\.]+)\/', "/v$($Latest.RemoteVersion)/"

  iwr -UseBasicParsing -Uri $($licenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  $Package.nuspecXml.package.metadata.licenseUrl = $licenseUrl
  $Latest.LicenseUrl = $licenseUrl
  $Package.nuspecXml.package.metadata.releaseNotes = $Package.nuspecXml.package.metadata.releaseNotes -replace '\/(latest|v[\d\.]+)\/', "/v$($Latest.RemoteVersion)/"

  Get-RemoteFiles -NoSuffix -Purge
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"        = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"        = "`${1} $($Latest.Checksum32)"
      "(?i)(LICENSE.*)\<[^\>]*>" = "`${1}<$($Latest.LicenseUrl)>"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"`[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $re = "\.zip$"
  $url32 = $download_page.Links | ? href -match $re | select -First 1 -expand href

  $version32 = $url32 -split "\.zip|db-" | select -last 1 -skip 1

  return @{
    RemoteVersion = $version32
    URL32         = $url32
    Version       = $version32
  }
}

update -ChecksumFor none
