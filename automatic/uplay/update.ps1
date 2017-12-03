Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$releases = 'https://uplay.ubi.com/'
$softwareName = 'Uplay'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"          = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
}

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\uplay.exe"
  Get-WebFile $url32 $dest | Out-Null

  return @{
    URL32          = $url32
    Version        = Get-Item $dest | % { $_.VersionInfo.ProductVersion }
    Checksum32     = Get-FileHash $dest -Algorithm SHA512 | % Hash
    ChecksumType32 = 'sha512'
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $url32 = $download_page.Links | ? outerHTML -match "\>Download Uplay"| select -first 1 -expand href

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
