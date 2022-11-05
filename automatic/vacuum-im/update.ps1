Import-Module AU

$releases = 'https://github.com/Vacuum-IM/vacuum-im/releases/latest'
$softwareName = 'vacuum-im*'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_AfterUpdate($Package) {
  $releaseNotes = "
[Software Changelog]($($Latest.ReleaseNotes))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/$($Latest.PackageName)/Changelog.md)
    "
  Update-Metadata -key "releaseNotes" -value $releaseNotes
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseNotes)>"
      "(?i)(\s*Non-GPO\s*)\<.*\>"         = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*GPO\s*)\<.*\>"             = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum non-GPO?\:).*"   = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum GPO?\:).*"       = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"         = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(\['file'\]\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $release = Get-LatestGithubReleases -repoUser 'Vacuum-IM' -repoName 'vacuum-im' | % latest

  $re = '\.msi$'

  @{
    URL32        = $release.Assets | ? { $_ -match $re -and $_ -notmatch 'GPO' }
    URL64        = $release.Assets | ? { $_ -match $re -and $_ -match 'GPO' }
    Version      = $release.Version
    ReleaseNotes = $release.ReleaseUrl
  }
}

update -ChecksumFor none
