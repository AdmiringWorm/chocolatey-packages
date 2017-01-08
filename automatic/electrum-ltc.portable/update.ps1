import-module au
. "$PSScriptRoot\..\electrum-ltc\update.ps1"

$releases = 'https://electrum-ltc.org'

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL_P
  $Latest.ChecksumType32 = 'sha256'

  if (!(Test-Path "$PSScriptRoot\tools")) {
    New-Item -ItemType Directory "$PSScriptRoot\tools"
  }

  Get-RemoteFiles -Purge -DontAppendArch -FileNameBase 'electrum-ltc'
}

function global:au_SearchReplace {
  $softwareName = 'Electrum-LTC*'
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"          = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\$($Latest.PackageName).nuspec" = @{
      "(?i)(^\s*\<releaseNotes\>).*(\<\/releaseNotes\>)" = "`${1}https://github.com/pooler/electrum-ltc/blob/$($Latest.RemoteVersion)/RELEASE-NOTES`${2}"
    }
  }
}

update -ChecksumFor none
