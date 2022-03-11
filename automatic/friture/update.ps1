[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$releases = 'https://github.com/tlecomte/friture/releases'
$softwareName = 'Friture*'

function global:au_BeforeUpdate($package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { Remove-Item -Force $licenseFile }

  Invoke-WebRequest -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw 'Unknown license download. Please verify it still contains distribution rights.'
  }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate($Package) {
  Update-Metadata -key 'releaseNotes' -Value "[Software Changelog]($($Latest.ReleaseNotes))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/friture/Changelog.md)"

  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    '.\legal\VERIFICATION.txt'      = @{
      '(?i)(^\s*location on\:?\s*)\<.*\>' = "`${1}<$releases>"
      '(?i)(\s*1\..+)\<.*\>'              = "`${1}<$($Latest.URL32)>"
      '(?i)(^\s*checksum\s*type\:).*'     = "`${1} $($Latest.ChecksumType32)"
      '(?i)(^\s*checksum(32)?\:).*'       = "`${1} $($Latest.Checksum32)"
    }
    '.\tools\chocolateyInstall.ps1' = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.msi$'
  $urls32 = $download_page.Links | Where-Object href -Match $re | Select-Object -First 1 -expand href | ForEach-Object { 'https://github.com' + $_ }

  $streams = @{}
  $urls32 | ForEach-Object {
    $verRe = '\/'
    $tag = $_ -split "$verRe" | Select-Object -Last 1 -Skip 1
    $version = Get-Version $tag

    if (!($streams.ContainsKey($version.ToString(2)))) {
      $streams.Add($version.ToString(2), @{
          Version      = $version.ToString()
          URL32        = $_
          ReleaseNotes = "https://github.com/tlecomte/friture/releases/tag/$tag"
        })
    }
  }

  # Update the latest version to be the latest stream
  $key = $streams.Keys | Sort-Object -Descending | Select-Object -First 1
  $streams.Add('latest', $streams[$key])
  $streams.Remove($key)

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
