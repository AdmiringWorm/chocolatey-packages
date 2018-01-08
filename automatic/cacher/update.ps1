Import-Module AU

$releases = 'https://www.cacher.io/'
$softwareName = 'Cacher*'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
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

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $regexFormat = "{0}\:\s*[`"']([^`"']+)"

  if ($download_page.Content -match ($regexFormat -f "downloadHost")) {
    $downloadHost = $matches[1]
  }
  else { throw "The download host was not found!!!" }

  if ($download_page.Content -match ($regexFormat -f "windowsDownloadHost")) {
    $windowsDownloadHost = $matches[1]
  }

  $download_page = Invoke-WebRequest -uri ($downloadHost + "/latest.yml") -UseBasicParsing

  $regexFormat = "(?m){0}\:\s*(?:\>\-\s*)?([^\r\n]+)"

  if ($download_page -match ($regexFormat -f "version")) {
    $version = $matches[1]
  }

  if ($download_page -match ($regexFormat -f "sha512")) {
    $checksum = $matches[1]
    $checksumType = 'sha512'
    $checksum = [string]::Join('', ([System.Convert]::FromBase64String($checksum) | % { "{0:x2}" -f $_ }))
  }

  if ($download_page -match ($regexFormat -f 'Path')) {
    $url = "$windowsDownloadHost/$($matches[1])"
  }

  return @{
    Version        = $version
    URL32          = [uri]::EscapeUriString($url)
    Checksum32     = $checksum
    ChecksumType32 = $checksumType
  }
}

update -ChecksumFor 32
