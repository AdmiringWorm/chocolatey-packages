$ErrorActionPreference = 'Stop';
import-module au
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$versionDirUrl = 'http://files.jrsoftware.org/is/';

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha256'
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate {
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(file server\s*)\<.*\>" = "`${1}<$($Latest.Releases)>"
      "(?i)(1\..+)\<.*\>"          = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"          = "`${1} $($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName32)`""
    }
    ".\innosetup.nuspec"            = @{
      "(\<id\>).*(\<\/id\>)"                     = "`${1}InnoSetup`${2}"
      "(?i)(^\s*\[Software Changelog\]\().*(\))" = "`${1}$($Latest.ReleaseNotesUrl)`${2}"
    }
  }
}

function global:au_GetLatest {
  $versionDirResponse = Invoke-WebRequest -UseBasicParsing -Uri $versionDirUrl;
  $versionReleaseDirs = $versionDirResponse.Links | ? href -match "^[\d\.]+\/$" | select -ExpandProperty href

  $streams = @{}
  $versionReleaseDirs | % {
    $versionReleaseDir = $_

    $download_page = Invoke-WebRequest -UseBasicParsing -Uri ($versionDirUrl + $versionReleaseDir)

    $res = @(
      'innosetup-[6-9][\d\.]+(\-beta)?\.exe'
      'innosetup.*unicode(\-dev\-[\d]*)?\.exe'
      'isetup\-[\d\.]+\.exe'
    )

    for ($i = 0; $i -lt $res.Count; $i++) {
      $file = $download_page.links | ? href -match $res[$i] | select -Last 1 -expand href
      if ($file) { break };
    }

    if (!$file) {
      return
    }
    $url = ($versionDirUrl + $versionReleaseDir + $file)

    $version = $url -split 'setup\-|\-unicode|.exe' | select -Last 2 -Skip 1
    $releaseNotes = "http://www.jrsoftware.org/files/is$($versionReleaseDir.TrimEnd('/'))-whatsnew.htm"
    try {
      iwr -UseBasicParsing -Uri $releaseNotes
    } catch {
      $releaseNotes = "https://jrsoftware.github.io/issrc/whatsnew.htm"
    }

    if ($version[0] -and $version[1]) {
      $version = Get-Version ($version[0] + $version[1])
    }
    else {
      $version = Get-Version $version[0]
    }

    $streams.Add('major-' + ($version.ToString(1)), @{
      URL32 = $url
      Version = $version
      ReleaseNotesUrl = $releaseNotes
      Releases = ($versionDirUrl + $versionReleaseDir)
    })
  }

  if ($streams.Count -eq 0) { throw "No versions of Inno Setup was found" }

  $key = $streams.Keys | ? { $streams[$_].Version -notmatch '\-' } | sort -Descending | select -first 1
  $streams.Add("latest", $streams[$key])
  $streams.Remove($key)

  return @{ Streams = $streams }
}

update -ChecksumFor none
