Import-Module Chocolatey-AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releasesFormat = "https://electron.authy.com/download?channel=stable&arch={0}&platform=win32&version=latest&product=authy"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyinstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)'.*'"       = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum64\s*=\s*)'.*'"     = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)'.*'" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $url64 = Get-RedirectedUrl ($releasesFormat -f "x64")

  $version64 = $url64 -split '\/' | select -last 1 -skip 3

  @{
    URL64          = $url64
    Version        = $version64
    ChecksumType64 = 'sha512'
  }
}

update -ChecksumFor 64
