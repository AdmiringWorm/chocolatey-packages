Import-Module Chocolatey-AU

$domain = 'https://github.com'
$releases = "$domain/FStarLang/FStar/releases"
$padUnderVersion = '0.9.7'


function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob','raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum(64)?\:).*"       = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Metadata -key 'releaseNotes' -value "[Software Changelog]($($Latest.ReleaseNotes))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/fstar/Changelog.md)"

  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $release = Get-LatestGithubReleases -repoUser 'FStarLang' -repoName 'FStar' | % latest

  $re = '\.zip$'
  $url64 = $release.Assets | ? { $_ -match $re }

  $verRe = '\/v?'
  $version64 = $url64 -split "$verRe" | select -last 1 -skip 1
  @{
    URL64        = $url64
    Version      = Get-FixVersion $release.Version -OnlyFixBelowVersion $padUnderVersion
    PackageName  = 'FStar'
    ReleaseNotes = $release.ReleaseUrl
  }
}

update -ChecksumFor none
