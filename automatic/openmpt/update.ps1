Import-Module AU

$releases = 'https://openmpt.org/download'

function downloadLicense {
  $license = "https://source.openmpt.org/svn/openmpt/trunk/OpenMPT/LICENSE"
  $outPath = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $outPath) {
    rm -force $outPath
  }

  iwr -Uri $license -OutFile $outPath -UseBasicParsing
}

function global:au_BeforeUpdate {
  downloadLicense
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate($Package) {
  $releaseNotes = @"
[Software Changelog](https://openmpt.org/release_notes/)
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/openmpt/Changelog.md)
"@

  Update-Metadata -key "releaseNotes" -value $releaseNotes
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>"       = "`${1}<$releases>"
      "(?i)(\s*Download the following.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"           = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"             = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'Setup\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $verRe = '[-]'
  [version]$version32 = $url32 -split "$verRe" | select -last 1 -skip 1

  @{
    URL32   = Get-RedirectedUrl $url32
    Version = $version32
  }
}

update -ChecksumFor none
