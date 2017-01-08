﻿import-module au
. "$PSScriptRoot\..\electrum-ltc\update.ps1"

$releases = 'https://electrum-ltc.org'

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL_I
  $Latest.ChecksumType32 = 'sha256'

  Get-RemoteFiles -Purge -DontAppendArch
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

    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"`[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*softwareName\s*=\s*)'.*'" = "`$1'$softwareName'"
      "(?i)(^\s*packageName\s*=\s*)'.*'" = "`$1'$($Latest.PackageName)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)(\s*\-SoftwareName\s*)'.*'" = "`$1'$softwareName'"
      "(?i)(^[$]packageName\s*=\s*)'.*'" = "`$1'$($Latest.PackageName)'"
    }
    ".\$($Latest.PackageName).nuspec" = @{
      "(?i)(^\s*\<releaseNotes\>).*(\<\/releaseNotes\>)" = "`${1}https://github.com/pooler/electrum-ltc/blob/$($Latest.RemoteVersion)/RELEASE-NOTES`${2}"
    }
  }
}

update -ChecksumFor none
