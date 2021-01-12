[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://www.inveigle.net/cmail/download.shtml'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
  # Extract the archive so we can grab the ThirdParty.txt file
  $archive = gci "$PSScriptRoot\tools\*.zip" | select -first 1
  $tempLoc = "$env:TEMP\cmail"
  Expand-Archive -Path $archive -DestinationPath $tempLoc
  $tpFile = Get-ChildItem $tempLoc -Recurse -Filter "ThirdParty.txt" | select -First 1 -Expand FullName
  Move-Item $tpFile "$PSScriptRoot\legal\ThirdParty.txt" -Force
  Remove-Item -Force $tempLoc -Recurse
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

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

  $urls = $download_page.Links | ? href -match '(amd64|x86).*\.zip$' | select -first 2 -expand href | % { 'https://www.inveigle.net' + $_ }

  $url32 = $urls | ? { $_ -match 'x86' }
  $url64 = $urls | ? { $_ -match 'amd64' }

  $verRe = 'CMail_([\d\.]+)_(?:x86|amd64)(?:\-(.*))?\.zip$'

  if ($url32 -match $verRe) {
    $version32 = $Matches[1]

    if ($Matches[2]) { $version32 = "$version32-$($Matches[2])" }
  }

  if ($url64 -match $verRe) {
    $version64 = $Matches[1]

    if ($Matches[2]) { $version64 = "$version64-$($Matches[2])" }
  }

  if ($version32 -ne $version64) { throw "32bit and 64bit version do not match" }

  return @{
    URL32   = $url32
    URL64   = $url64
    Version = $version32
  }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
