[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://github.com/codecadwallader/codemaid/releases'

function global:au_BeforeUpdate($Package) {
  Copy-Item $Latest.ReadmePath "$PSScriptRoot\Readme.md"

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
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^\s*File\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
    '.\tools\chocolateyuninstall.ps1' = @{
      "(?i)(^\s*VsixId\s*=\s*)'.*'" = "`${1}'$($Latest.VsixId)'"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  Update-Metadata -key 'title' -value $Latest.PackageTitle
}

function GetVsixIdFromManifest([string]$tag) {
  $url = "https://github.com/codecadwallader/codemaid/raw/$tag/CodeMaid/source.extension.vsixmanifest"
  $manifest = New-Object xml
  $manifest.Load($url)

  $id = $manifest.PackageManifest.Metadata.Identity.Id | select -First 1
  return $id
}

function GetNewVsixIdFromManifest([string]$tag) {
  $url = "https://github.com/codecadwallader/codemaid/blob/$tag/CodeMaid.VS2022/source.extension.vsixmanifest"
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'VS\d{4}.*\.vsix$'
  $urls = $download_page.Links | ? href -match $re | select -expand href | % { 'https://github.com' + $_ }

  $streams = @{}
  $urls | % {
    $verRe = '\.v|\.vsix$'
    $version = $_ -split "$verRe" | select -last 1 -skip 1
    $version = Get-Version $version
    if ($_ -match "VS2022") {
      $id = "vs2022-codemaid"
      $streamName = "vs2022-$($version.ToString(2))"
      $vsixId = GetVsixIdFromManifest -tag ($_ -split '\/' | select -last 1 -skip 1)
      $title = "CodeMaid (VS2022)"
      $readme = "$PSScriptRoot\VS2022Readme.md"
    }
    elseif ($_ -match "VS2019") {
      $id = "vs2019-codemaid"
      $streamName = "vs2019-$($version.ToString(2))"
      $vsixId = GetNewVsixIdFromManifest -tag ($_ -split '\/' | select -last 1 -skip 1)
      $title = "CodeMaid (VS2019)"
      "$PSScriptRoot\VS2019Readme.md"
    }
    else {
      return "ignore"
    }

    if (!($streams.ContainsKey($streamName))) {
      $streams.Add($streamName, @{
          Version      = $version.ToString()
          URL32        = $_
          VsixId       = $vsixId
          PackageName  = $id
          PackageTitle = $title
          ReadmePath   = $readme
        })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
