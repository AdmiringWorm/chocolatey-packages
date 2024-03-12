Import-Module Chocolatey-AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$releasesUrl = 'https://docs.icons8.com/release-notes/'
$softwareName = 'Lunacy'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

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

function global:au_GetLatest {
  $download_page = Invoke-WebRequest $releasesUrl -UseBasicParsing

  $url32 = $download_page.Links | ? href -Match "\d+\.[\d\.]+\.exe$" | select -First 1 -ExpandProperty href
  $version = $url32 -split "_|\.exe" | select -Last 1 -Skip 1

  return @{
    URL32          = $url32
    Version        = $version
    ChecksumType32 = 'sha512'
  }
}

update -ChecksumFor none
