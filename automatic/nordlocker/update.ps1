Import-Module AU
Import-Module "$env:ChocolateyInstall/helpers/chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot/../../scripts/au_extensions.psm1"

$releases = 'https://nordlocker.com/download/windows/'
$softwareName = 'NordLocker*'
$dest = "$env:TEMP\NordLockerSetup.exe"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"          = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  Remove-Item -Force $dest
}

function GetResultInformation([string]$url32) {
  Get-WebFile $url32 $dest | Out-Null
  $version = Get-Item $dest | % { $_.VersionInfo.ProductVersion.Trim() }
  if ($version -match "(\d+\.){3}0$") {
    $version = $version -replace "\.0$", ""
  }

  return @{
    URL32          = $url32
    Version        = $version
    RemoteVersion  = $version
    Checksum32     = Get-FileHash $dest -Algorithm SHA512 | % Hash
    ChecksumType32 = 'sha512'
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $result = Update-OnETagChanged -execUrl $url32 -OnETagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 } }

  return $result
}

update -ChecksumFor none
