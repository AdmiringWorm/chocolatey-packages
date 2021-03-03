Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://www.snapgene.com/snapgene-viewer/'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*url\s*=\s*)'.*'"          = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_AfterUpdate {
  Update-ChangelogVersion -version $Latest.Version
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'download.*os=windows'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  if ($url32.StartsWith("/")) {
    $url32 = New-Object uri([uri]$releases, [string]$url32)
  }

  $url32 = Get-RedirectedUrl $url32

  $verRe = 'viewer_|_win'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1

  @{
    URL32          = [uri]$url32
    ChecksumType32 = 'sha512'
    Version        = [version]$version32
  }
}

update -ChecksumFor 32
