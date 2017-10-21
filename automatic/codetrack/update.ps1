Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://www.getcodetrack.com/releases.html'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_AfterUpdate {
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum type\:).*" = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*" = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'codetrack.*\.zip$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://www.getcodetrack.com/' + $_ }

  $verRe = 'k_|\.zip$'
  $version32 = ($url32 -split "$verRe" | select -last 1 -skip 1) -replace '_','.'
  @{
    URL32 = $url32
    Version = $version32
  }
}

update -ChecksumFor none
