Import-Module Chocolatey-AU

$releases = 'https://github.com/abau/dilay/releases/latest'

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}
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
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }


  }
}

function addDomainIfNeeded([string]$url, [uri]$oldUrl) {
  return New-Object uri($oldUrl, $url)
}

function global:au_GetLatest {
  $release = Get-LatestGithubReleases -repoUser 'abau' -repoName 'dilay' | % latest

  $re = '\.msi$'
  $url32 = $release.Assets | ? { $_ -match $re } | select -first 1

  @{
    URL32   = $url32
    Version = $release.Version
  }
}

update -ChecksumFor none
