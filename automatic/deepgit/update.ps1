Import-Module Chocolatey-AU

$domain = 'https://www.syntevo.com'
$packagePage = "$domain/deepgit"
$releases = "$packagePage/download"
$softwareName = 'DeepGit'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"          = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.zip$'
  $url = $download_page.Links | ? href -match $re | select -first 1 -expand href | % {
    if ($_.StartsWith("/")) {
      return $domain + $_.TrimStart('.')
    } else {
      return $packagePage + $_.TrimStart('.')
    }
  }

  $version = $url -split 'jre\-|\.zip|setup\-|win\-' | select -last 1 -skip 1
  $version = $version -replace '_', '.'
  if ($version -match '^\d+$') {
    $version += ".0"
  }

  @{
    URL32          = $url
    Version        = $version
    ChecksumType32 = 'sha512'
  }
}

update -ChecksumFor none
