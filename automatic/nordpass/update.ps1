Import-Module AU
Import-Module "$env:ChocolateyInstall/helpers/chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot/../../scripts/au_extensions.psm1"

$releases = 'https://nordpass.com/download/windows/'
$softwareName = 'NordPass*'
$dest = "$env:TEMP\NordPassSetup.exe"
$dest32 = $dest -replace ".exe$", "_x86.exe"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyBeforeModify.ps1" = @{
      "(?i)^([$]serviceName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
    ".\tools\chocolateyInstall.ps1"      = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"   = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"            = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*url64Bit\s*=\s*)'.*'"       = "`${1}'$($Latest.URL64)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"       = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'"   = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*checksum64\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum64)'"
      "(?i)^(\s*checksumType64\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType64)'"
    }
    ".\tools\chocolateyUninstall.ps1"    = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  Remove-Item -Force $dest
}

function GetResultInformation([string]$url32, [string]$url64) {
  Get-WebFile $url64 $dest | Out-Null
  $version = Get-Item $dest | % { $_.VersionInfo.ProductVersion.Trim() }
  if ($version -match "(\d+\.){3}0$") {
    $version = $version -replace "\.0$", ""
  }

  Get-WebFile $url32 $dest32 | Out-Null
  $alg = 'sha512'

  return @{
    URL32          = $url32
    URL64          = $url64
    Version        = $version
    RemoteVersion  = $version
    Checksum32     = Get-FileHash $dest32 -Algorithm $alg | % Hash
    Checksum64     = Get-FileHash $dest -Algorithm $alg | % Hash
    ChecksumType32 = $alg
    ChecksumType64 = $alg
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $url64 = $download_page.Links | ? href -match "Setup\.exe$" | select -first 1 -expand href | % { $_ -replace "^http:", "https:" }
  $url32 = $download_page.Links | ? href -match "Setup_x86\.exe$" | select -first 1 -expand href | % { $_ -replace "^http:", "https:" }

  $result = Update-OnETagChanged -execUrl $url64 -OnETagChanged {
    GetResultInformation $url32 $url64
  } -OnUpdated { @{ URL32 = $url32 ; URL64 = $url64 } }

  return $result
}

update -ChecksumFor none
