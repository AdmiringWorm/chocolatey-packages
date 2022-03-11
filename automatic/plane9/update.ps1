Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://www.plane9.com/download'
$softwareName = 'Plane9*'
$padUnderVersion = '2.5.2'

function global:au_BeforeUpdate($Package) {
  Invoke-VirusTotalScan $Package
}

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

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $verRe = '[-]|\.exe$'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32          = [uri]$url32
    ChecksumType32 = 'sha512'
    Version        = [version](Get-FixVersion -Version $version32 -OnlyFixBelowVersion $padUnderVersion)
  }
}

update -ChecksumFor none
