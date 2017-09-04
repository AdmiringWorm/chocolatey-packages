Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releasesFormat = "https://electron.authy.com/download?channel=stable&arch={0}&platform=win32&version=latest"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyinstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)'.*'"            = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*url64bit\s*=\s*)'.*'"       = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum\s*=\s*)'.*'"       = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)'.*'"   = "`$1'$($Latest.ChecksumType32)'"
      "(?i)(^\s*checksum64\s*=\s*)'.*'"     = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)'.*'" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_AfterUpdate {
  Set-DescriptionFromReadme -SkipFirst 1
}

function global:au_GetLatest {
  $url32 = Get-RedirectedUrl ($releasesFormat -f "x32")
  $url64 = Get-RedirectedUrl ($releasesFormat -f "x64")

  $version32 = $url32 -split '\/' | select -last 1 -skip 3
  $version64 = $url64 -split '\/' | select -last 1 -skip 3

  if ($version32 -ne $version64) {
    throw "The version for 32bit and the version for 64bit does not match"
  }

  @{
    URL32 = $url32
    URL64 = $url64
    Version = $version32
  }
}

update
