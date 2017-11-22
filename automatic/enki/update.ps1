Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$domain = 'https://github.com'
$releases = "$domain/andreikop/enki/releases"
$softwareName = 'Enki*'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"             = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\)[^`"]*`"" = "`${1}$($Latest.FileName32)`""
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases

  $re = '\.exe$'
  [uri]$url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $domain + $_ }

  $verRe = '\/v?'
  [version]$version32 = $url32 -split "$verRe" | select -last 1 -skip 1

  @{
    URL32   = $url32
    Version = $version32
  }
}

update -ChecksumFor none
