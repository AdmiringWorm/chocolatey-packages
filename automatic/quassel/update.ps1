Import-Module AU

$releases = 'http://quassel-irc.org/downloads'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }
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
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $baseURL = 'http://quassel-irc.org'
  $url32 = $download_page.Links | ? href -match 'x86.*\.exe$' | select -first 1 -expand href | % { $baseURL + $_ }
  $url64 = $download_page.Links | ? href -match 'x64.*\.exe$' | select -first 1 -expand href | % { $baseURL + $_ }
  $version = $null
  $url32 -match '\d+\.\d+\.\d+'
  $version = $Matches[0]

  @{
    URL32   = [uri]$url32
    URL64   = [uri]$url64
    Version = [version]$version
  }
}

update -ChecksumFor none
