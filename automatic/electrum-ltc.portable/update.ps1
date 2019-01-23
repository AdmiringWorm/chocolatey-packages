import-module au
. "$PSScriptRoot\..\electrum-ltc\update.ps1"

$releases = 'https://electrum-ltc.org'

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL_P
  $Latest.ChecksumType32 = 'sha256'

  if (!(Test-Path "$PSScriptRoot\tools")) {
    New-Item -ItemType Directory "$PSScriptRoot\tools"
  }

  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob','raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  Get-RemoteFiles -Purge -NoSuffix -FileNameBase 'electrum-ltc'
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"        = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"        = "`${1} $($Latest.Checksum32)"
    }
    ".\$($Latest.PackageName).nuspec" = @{
      "(?i)(^\s*\[Software Changelog\]\().*(\))" = "`${1}https://github.com/pooler/electrum-ltc/blob/$($Latest.RemoteVersion)/RELEASE-NOTES`${2}"
    }
  }
}

update -ChecksumFor none
