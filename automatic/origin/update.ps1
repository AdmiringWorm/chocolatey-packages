Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$padUnderVersion = '10.5.17'

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)'.*'"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)'.*'"     = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)'.*'" = "`$1'$($Latest.ChecksumType32)'"
      "(?i)(\s*\-version\s*)'.*'"         = "`$1'$($Latest.RemoteVersion)'"
      "(?i)(Parse\()'.*'\)"               = "`$1'$($Latest.RemoteVersion)')"
    }
  }
}

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\origin.exe"
  Get-WebFile $url32 $dest | Out-Null
  $version = Get-Item $dest | % { Get-FixVersion -version ($_.VersionInfo.ProductVersion -replace ',', '.') -OnlyFixBelowVersion $padUnderVersion }

  return @{
    URL32          = $url32
    Version        = Get-FixVersion -Version $version -OnlyFixBelowVersion $padUnderVersion
    RemoteVersion  = $version
    Checksum32     = Get-FileHash $dest -Algorithm SHA512 | % Hash
    ChecksumType32 = 'sha512'
  }
}

function global:au_GetLatest() {
  $url32 = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'

  $result = Update-OnETagChanged -execUrl $url32 -OnETagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 } }

  return $result
}

update -ChecksumFor none
