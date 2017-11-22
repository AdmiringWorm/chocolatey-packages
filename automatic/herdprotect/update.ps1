import-module au

$domain   = 'https://www.herdprotect.com'
$releases = "$domain/downloads.aspx"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases

  $re    = 'Setup\.exe$'
  $url   = $download_page.links | ? href -match $re | select -First 1 -expand href
  $url = $domain + $url

  $file = [System.IO.Path]::GetTempFileName()
  Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $file
  $checksum = Get-FileHash $file -Algorithm SHA256 | % Hash
  $version = (gi $file).VersionInfo.ProductVersion
  rm -Force $file

  @{
    URL32 = $url
    Version = $version
    Checksum32 = $checksum
    ChecksumType32 = 'sha256'
  }
}

try {
  update -ChecksumFor none
} catch {
  if ($_ -match "Invalid Version") {
    Write-Host "No version was found, ignoring..."
    "ignore"
  } else {
    throw $_
  }
}
