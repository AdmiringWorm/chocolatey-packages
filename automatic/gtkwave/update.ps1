Import-Module AU

$releases = 'https://sourceforge.net/projects/gtkwave/files/'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1 }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*" = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*" = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'win32\/$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -expand href -first 1 | % { 'https://sourceforge.net' + $_ }

  $download_page = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing

  $re = '\.zip\/download$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $version32 = $url32 -split '\-' | select -last 1 -skip 2

  @{ Version = [version]$version32; URL32 = $url32; FileType = 'zip' }
}

update -ChecksumFor none
