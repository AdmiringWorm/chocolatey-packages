Import-Module AU

$releases = 'https://sourceforge.net/projects/golly/files/golly/'
$softwareName = 'golly*'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl + "?format=raw") -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1
}
function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*" = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum64\:).*" = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'golly\-[\d]+\.[\d\.]+\/$'
  $releasesUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://sourceforge.net' + $_ }
  $download_page = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing

  $re = 'win\-64bit\.zip\/download$'
  $url64 = $download_page.links | ? href -match $re | select -first 1 -expand href

  $verRe = '[-]'
  $version64 = $url64 -split "$verRe" | select -last 1 -skip 2

  @{
    URL64 = $url64
    Version = $version64
    FileType = 'zip'
  }
}

update -ChecksumFor none
