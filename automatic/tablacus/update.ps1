Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releasesPart = 'https://tablacus.github.io/'
$releases = "${releasesPart}explorer_en.html"

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function glboal:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'te.*\.zip$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $releasesPart + $_ }

  $verRe = '\>\s*Version ([\d]+\.[\d\.]+)\s*\<'
  $Matches = $null
  $download_page.Content -match $verRe | Out-Null
  if ($Matches) { $version32 = $Matches[1] }
  @{
    URL32   = $url32
    Version = $version32
  }
}

update -ChecksumFor none
