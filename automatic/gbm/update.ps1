Import-Module AU

$softwareName = 'Game Backup Monitor*'
$repoInfo = @{
  repoUser = 'MikeMaximus'
  repoName = 'gbm'
}

function global:au_BeforeUpdate($Package) {
  # Download the latest License, and verify it is still an GNU GENERAL PUBLIC LICENSE
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm $licenseFile }
  iwr -UseBasicParsing -Uri ($Package.NuspecXml.package.metadata.licenseUrl -replace 'blob','raw') -OutFile $licenseFile

  $isCorrectLicense = Get-Content $licenseFile -Encoding UTF8 | ? { $_ -match 'GNU GENERAL PUBLIC LICENSE' } | select -first 1

  if (!$isCorrectLicense) { throw "License has changed, please update..." }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate {
  Update-Metadata -key "releaseNotes" -value @"
### [Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/gbm/Changelog.md)

### Software Release notes

$($Latest.ReleaseNotes)
"@
  Update-Changelog -useIssueTitle
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUrl)>"
      "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"         = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $latest = Get-LatestGithubReleases @repoInfo | % latest

  $re = '32\-bit\.Installer\.exe$'
  $url32 = $latest.Assets | ? { $_ -match $re }

  $re = '64\-bit\.Installer\.exe$'
  $url64 = $latest.Assets | ? { $_ -match $re }

  @{
    URL32   = $url32
    URL64   = $url64
    Version = $latest.Version
    ReleaseNotes = $latest.Body
    ReleaseUrl = $latest.ReleaseUrl
  }
}

update -ChecksumFor none
