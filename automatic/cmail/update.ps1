[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://www.inveigle.net/cmail/download.shtml'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
  # Extract the archive so we can grab the ThirdParty.txt file
  $archive = Get-Item "$PSScriptRoot\tools\*.zip"
  $tempLoc = "$env:TEMP\cmail"
  Expand-Archive -Path $archive -DestinationPath $tempLoc
  $tpFile = Get-ChildItem $tempLoc -Recurse -Filter "ThirdParty.txt" | select -First 1 -Expand FullName
  Move-Item $tpFile "$PSScriptRoot\legal\ThirdParty.txt" -Force
  Remove-Item -Force $tempLoc -Recurse
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.zip$'
  $urls32 = $download_page.Links | ? { $_.href -match $re -and $_.href -notmatch 'NoSSL' } | select -expand href | % { 'https://www.inveigle.net' + $_ }

  $streams = @{}
  $urls32 | % {
    $verRe = '_|\.zip'
    $version = $_ -split "$verRe" | select -last 1 -skip 1
    if ($version -match "^[\d\.]+[a-zA-Z]$") {
      [char]$letter = $version.substring($version.Length - 1, 1)
      [int]$num = $letter - [char]'a'
      $version = $version -replace $letter, ".$num"
    }

    $version = Get-Version $version

    $key = if ($version.PreRelease) { 'unstable' } else { 'stable' }
    if (!($streams.ContainsKey($key))) {
      $streams[$key] = @{
        Version = $version.ToString()
        URL32   = $_
      }
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
