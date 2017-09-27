Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://privazer.com/download.php'
$softwareName = 'privazer.install*'

function global:au_AfterUpdate { Set-DescriptionFromReadme -SkipFirst 1 }

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'" = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'free\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://privazer.com/' + $_ }

  $Matches = $null
  $download_page.Content -match "PrivaZer v([\d]+\.[\d\.]+)(?:\<span[^\>]+\>)?([\.\d]+)?"
  if (!$Matches) { throw "Version was not found" }
  if ($Matches[2]) {
    $version = $Matches[1] + $Matches[2]
  } else {
    $version = $Matches[1]
  }

  @{
    URL32 = $url32
    Version = $version
    ChecksumType32 = 'sha512'
  }
}

update -ChecksumFor 32
