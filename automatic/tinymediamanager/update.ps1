Import-Module "Chocolatey-AU"

$releases = 'https://release.tinymediamanager.org'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"             = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"    = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum(64)?\:).*"      = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases

  $re = 'windows.*.zip$'
  $url = $download_page.links | ? href -match $re | select -First 1 -expand href

  $version = $url -split '[-]' | select -Last 1 -Skip 2

  $url = [uri]::new([uri]$releases, $url)

  return @{
    URL64          = $url
    ChecksumType64 = 'sha256'
    Version        = $version
  }
}

update -ChecksumFor none
