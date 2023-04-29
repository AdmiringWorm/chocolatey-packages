Import-Module AU

$releases = 'https://sourceforge.net/projects/astyle/files/astyle/'

function global:au_BeforeUpdate {
  $Latest.LicenseURL = "https://sourceforge.net/p/astyle/code/HEAD/tree/trunk/AStyle/LICENSE.md?format=raw"
  # Download the latest License, and verify it is still an MIT license
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm $licenseFile }
  iwr -UseBasicParsing -Uri $Latest.LicenseURL -OutFile $licenseFile

  $isMITLicense = Get-Content $licenseFile -Encoding UTF8 | ? { $_ -match 'MIT License' }

  if (!$isMITLicense) { throw "License has changed, please update..." }


  Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<[^\>]*\>" = "`${1}<$($Latest.ReleaseUrl)>"
      "(?i)(\s*32\-Bit Software.*)\<[^\>]*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*64\-Bit Software.*)\<[^\>]*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"         = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"           = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"              = "`${1} $($Latest.Checksum64)"
      "(LICENSE\.txt[^\<]+)\<[^\>]*\>"        = "`${1}<$($Latest.LicenseURL)>"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'astyle(?: |%20)([\d\.]+)\/$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://sourceforge.net' + $_ }
  $download_page = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing

  $re = '\.zip'
  $url32 = $download_page.Links | ? { $_.href -match $re -and $_.href -notmatch 'x64' } | select -first 1 -expand href
  $url64 = $download_page.Links | ? href -match "-x64\.zip" | select -First 1 -expand href

  $version32 = $url32 -split "-|\.zip" | select -last 1 -skip 1
  $version64 = $url64 -split "-" | select -last 1 -skip 1

  if ($version32 -ne $version64) {
    throw "32bit and 64bit version does not match"
  }

  @{
    URL32      = $url32
    URL64      = $url64
    Version    = $version32
    FileType   = 'zip'
    ReleaseUrl = $releasesUrl
  }
}

update -ChecksumFor none
