[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$repoUser = 'box'
$repoName = 'boxcli'
$softwareName = 'BoxCLI'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob','raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  $releaseNotes = "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/boxcli/Changelog.md)`n`n## Software Release Notes`n"
  $releaseNotes += $Latest.ReleaseNotes

  Update-Metadata -key 'releaseNotes' -value $releaseNotes
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUri)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum(64)?\:).*"       = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  [array]$releases = Get-AllGithubReleases -repoUser $repoUser -repoName $repoName

  $streams = @{}
  $releases | % {
    if (!($streams.ContainsKey(($_.Version.ToString(2))))) {
      [array]$execs = $_.Assets | ? { $_ -match '\.msi' }
      if ($execs.Count -ne 1) { return ; }

      $streams.Add($_.Version.ToString(2), @{
          Version      = $_.Version.ToString()
          URL64        = $execs | select -first 1
          ReleaseNotes = $_.Body
          ReleaseUri   = $_.ReleaseUrl
        })
    }
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
