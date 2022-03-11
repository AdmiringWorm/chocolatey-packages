Import-Module AU

$releases = 'https://powdertoy.co.uk/Download/Platforms.html'
$changelog = 'https://powdertoy.co.uk/Download/Changelog.html'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
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

function global:au_AfterUpdate($Package) {
  Update-Metadata -key "releaseNotes" -value @"
[Software Changelog]($changelog)
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/$($Latest.PackageName)/Changelog.md)
"@
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'win32\.zip$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://powdertoy.co.uk' + $_ }

  $version_page = Invoke-WebRequest -Uri $changelog -UseBasicParsing
  if ($version_page.Content -match '\>\s*Version\s*(\d+\.[\d\.]+)') {
    $version32 = $Matches[1]
  }

  @{
    URL32   = $url32
    Version = $version32
  }
}

update -ChecksumFor none
