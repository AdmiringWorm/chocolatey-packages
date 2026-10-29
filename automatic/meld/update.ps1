[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module Chocolatey-AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://meldmerge.org/'
$gitlabHost = 'https://gitlab.gnome.org'
$gitlabProjectId = 301
$licenseSourceUrl = "$gitlabHost/api/v4/projects/$gitlabProjectId/repository/files/COPYING/raw?ref=main"
$softwareName = 'Meld'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  $licenseTempFile = "$licenseFile.tmp"
  try {
    Get-GitlabRepositoryFile -GitlabHost $gitlabHost -ProjectId $gitlabProjectId -FilePath 'COPYING' -OutFile $licenseTempFile | Out-Null
    if (!(Get-ValidOpenSourceLicense -path $licenseTempFile)) {
      throw 'Unknown license download. Please verify it still contains distribution rights.'
    }

    Move-Item -Force $licenseTempFile $licenseFile
  }
  finally {
    Remove-Item -Force $licenseTempFile -ErrorAction SilentlyContinue
  }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum(64)?\:).*"       = "`${1} $($Latest.Checksum64)"
      "(?i)(The file 'LICENSE\.txt'.+)\<.*\>" = "`${1}<$licenseSourceUrl>"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"         = "`${1}'$softwareName'"
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $latestPackage = Get-LatestGitlabPackage -GitlabHost $gitlabHost -ProjectId $gitlabProjectId -PackageName 'meld'
  $expectedFileName = "meld-$($latestPackage.Version).exe"
  [array]$installerFiles = $latestPackage.Files | Where-Object Name -EQ $expectedFileName

  if ($installerFiles.Count -ne 1) {
    throw "Expected exactly one '$expectedFileName' file in Meld package $($latestPackage.PackageId), but found $($installerFiles.Count)."
  }

  return @{
    Streams = @{
      latest = @{
        Version = $latestPackage.Version
        URL64   = $installerFiles[0].Url
        Options = $latestPackage.Options
      }
    }
  }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
