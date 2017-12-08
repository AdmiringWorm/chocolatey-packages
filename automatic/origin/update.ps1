Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$padUnderVersion = '10.5.5'

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)'.*'"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)'.*'"     = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)'.*'" = "`$1'$($Latest.ChecksumType32)'"
      "(?i)(\s*\-version\s*)'.*'"         = "`$1'$($Latest.RemoteVersion)'"
    }
  }
}

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\origin.exe"
  Get-WebFile $url32 $dest | Out-Null
  $version = Get-Item $dest | % { Get-FixVersion -version ($_.VersionInfo.ProductVersion -replace ',', '.') -OnlyFixBelowVersion $padUnderVersion }

  return @{
    URL32          = $url32
    Version        = $version
    RemoteVersion  = $version
    Checksum32     = Get-FileHash $dest -Algorithm SHA512 | % Hash
    ChecksumType32 = 'sha512'
  }
}

function global:au_GetLatest() {
  $url32 = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'

  if (($global:au_Force -ne $true) -and (Test-Path "$PSScriptRoot\info")) {
    $items = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -first 1 | % { $_ -split '\|' }
    $headers = Get-WebHeaders $url32
    if ($items) {
      $etag = $items[0]
      $version = $items[1]
      if ($headers.ETag -ne $etag) {
        $result = GetResultInformation $url32
        "$($headers.ETag)|$($result.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
      }
      else {
        $result = @{ URL32 = $url32; Version = $version }
      }
    }
    else {
      $result = GetResultInformation $url32
      "$($headers.ETag)|$($result.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
    }
  }
  else {
    $headers = Get-WebHeaders $url32
    $result = GetResultInformation $url32
    "$($headers.ETag)|$($result.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
  }

  return $result
}

update -ChecksumFor none
