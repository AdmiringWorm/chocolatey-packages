import-module au
import-module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$releases = "http://abau.org/dilay/download.html"

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha256'
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"          = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"       = "`${1} $($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"`[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $re = '\.msi$'
  $url = $download_page.links | ? href -match $re | select -first 1 -expand href
  $version = $url -split '/' | select -last 1 -skip 1

  @{ URL32 = $url; Version = $version };
}

update -ChecksumFor none
