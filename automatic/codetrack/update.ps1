import-module au
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$domain   = 'https://www.getcodetrack.com'
$releases = "$domain/releases.html"

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_AfterUpdate {
  Set-DescriptionFromReadme -SkipFirst 1
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*" = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*" = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyinstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)[^`"]*`"" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest $releases

  $url = $download_page.links | ? href -match 'codetrack.*\.zip$' | select -first 1 -expand href

  $version = ($url -split 'k_|\.zip$' | select -last 1 -skip 1) -replace '_','.'

  @{ URL32 = ($domain + '/' + $url); Version = $version }
}

update -ChecksumFor none
