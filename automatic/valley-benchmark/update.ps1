$ErrorActionPreference = 'Stop';
Import-Module Chocolatey-AU

$releases = 'https://benchmark.unigine.com/valley'
$softwareName = 'Unigine Valley Benchmark*'

function global:au_BeforeUpdate($Package) {
  Invoke-VirusTotalScan $Package
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(\s*softwareName\s*=\s*)'.*'" = "`${1}'$($softwareName)'"
      "(?i)(\s*url\s*=\s*)'.*'"          = "`${1}'$($Latest.URL32)'"
      "(?i)(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32 = $download_page.Links | ? href -match "\.exe$" | select -First 1 -expand href

  $version = $url32 -split "-|\.exe" | select -Last 1 -Skip 1

  @{
    ChecksumType32 = 'sha512'
    URL32          = $url32
    Version        = $version
  }
}

update -ChecksumFor none
