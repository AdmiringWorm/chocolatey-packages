Import-Module AU
Import-Module "$env:ChocolateyInstall/helpers/chocolateyInstaller.psm1"

$softwareName = 'DiskInternals Linux Reader'
$releases = "https://www.diskinternals.com/linux-reader/"

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)(^\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function GetResultInformation([string]$url32) {
  $fileName = Split-path -Leaf $url32
  $dest = "$PSScriptRoot\tools\$fileName"

  Get-WebFile $url32 $dest

  $item = Get-Item $dest
  $version = $item.VersionInfo.FileVersion

  return @{
    URL32          = $url32
    Version        = $version
    RemoteVersion  = $version
    Checksum32     = Get-FileHash $dest -Algorithm SHA256 | % Hash
    ChecksumType32 = 'sha256'
    FileName32     = $fileName
  }
}

function global:au_GetLatest() {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $url32 = $download_page.Links | ? href -match "\.exe$" | select -expand href -first 1

  $result = Update-OnETagChanged -execUrl $url32 -OnEtagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 } }

  return $result
}

update -ChecksumFor none
