Import-Module AU

$domain = 'https://github.com'
$releases = "$domain/FStarLang/FStar/releases"
$padUnderVersion = '0.9.7'


function global:au_BeforeUpdate($Package) {
  # Download the latest License, and verify it is still an Apache License
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm $licenseFile }
  iwr -UseBasicParsing -Uri ($Package.NuspecXml.package.metadata.licenseUrl -replace 'blob','raw') -OutFile $licenseFile

  $isCorrectLicense = Get-Content $licenseFile -Encoding UTF8 | ? { $_ -match 'Apache License' } | select -first 1

  if (!$isCorrectLicense) { throw "License has changed, please update..." }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum(64)?\:).*"       = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_AfterUpdate {
  Update-Metadata -key 'releaseNotes' -value "[Software Changelog]($($Latest.ReleaseNotes))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/fstar/Changelog.md)"

  Update-Changelog -useIssueTitle
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.zip$'
  $url64 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $domain + $_ }

  $verRe = '\/v?'
  $version64 = $url64 -split "$verRe" | select -last 1 -skip 1
  @{
    URL64        = $url64
    Version      = Get-FixVersion $version64 -OnlyFixBelowVersion $padUnderVersion
    PackageName  = 'FStar'
    ReleaseNotes = "https://github.com/FStarLang/FStar/releases/tag/v$($version64)"
  }
}

update -ChecksumFor none
