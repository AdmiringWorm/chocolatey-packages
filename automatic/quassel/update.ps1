Import-Module AU

$releases = 'http://quassel-irc.org/downloads'
$softwareName = 'Quassel*'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(^\s*x32:).*"                  = "`${1} $($Latest.URL32)"
      "(?i)(^\s*x64:).*"                  = "`${1} $($Latest.URL64)"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum32\:).*"          = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"         = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $baseURL = 'http://quassel-irc.org'
  $url32 = $download_page.Links | ? href -match 'x86.*\.exe$' | select -first 1 -expand href | % { $baseURL + $_ }
  $url64 = $download_page.Links | ? href -match 'x64.*\.exe$' | select -first 1 -expand href | % { $baseURL + $_ }

  $verRe = '[-]|\.exe$'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1

  @{
    URL32   = [uri]$url32
    URL64   = [uri]$url64
    Version = [version]$version32
  }
}

update -ChecksumFor none
