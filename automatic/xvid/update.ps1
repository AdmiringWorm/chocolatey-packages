import-module au
import-module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$releases = "https://www.xvid.com/download/"

function global:au_BeforeUpdate {
  Remove-Item "$PSScriptRoot\tools\*.exe"

  $Latest.FileName = Get-WebFileName $Latest.URL32 "xvid.exe"
  $filePath = "$PSScriptRoot\tools\$($Latest.FileName)"
  Get-WebFile $Latest.URL32 $filePath

  $Latest.ChecksumType32 = 'sha256'
  $Latest.Checksum32 = Get-FileHash -Algorithm $Latest.ChecksumType32 -Path $filePath | % Hash
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(mirror on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"        = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"        = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"`[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName)`""
    }
  }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases;

    $re = "Xvid.*\.exe";
    $url = $download_page.links | ? href -Match $re | select -First 1 -ExpandProperty href;

    $version = $url -split '-' | select -Last 1 -Skip 1;

    $Latest = @{
      Version = $version
      URL32 = $url
    }

    return $Latest;
}

update -ChecksumFor none
