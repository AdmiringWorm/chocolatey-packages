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

function global:au_AfterUpdate {
  $releaseNotes = @"
[Software Changelog](https://openmpt.org/release_notes/)
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/openmpt/Changelog.md)
"@

  Update-Metadata -key "releaseNotes" -value $releaseNotes
  Update-Changelog -useIssueTitle
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'Setup\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href

  $re = 'Setup-x64\.exe$'
  $url64 = $download_page.links | ? href -match $re | select -first 1 -expand href

  $verRe = '[-]'
  [version]$version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  [version]$version64 = $url64 -split "$verRe" | select -last 1 -skip 2
  if ($version32 -ne $version64) {
    throw "32bit version do not match the 64bit version"
  }
  @{
    URL32   = Get-RedirectedUrl $url32
    URL64   = Get-RedirectedUrl $url64
    Version = $version32
  }
}

update -ChecksumFor none
