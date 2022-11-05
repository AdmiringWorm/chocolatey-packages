Import-Module AU

$softwareName = 'qilin-editor*'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Metadata -key "releaseNotes" -value @"
[Software Changelog](https://github.com/qilin-editor/qilin-app/releases/tag/v$($Latest.RemoteVersion))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/qilin-editor/Changelog.md)
"@
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $release = Get-AllGithubReleases -repoUser 'qilin-editor' -repoName 'qilin-app' | select -first 1

  $re = 'windows\.zip$'
  $url32 = $release.Assets | Where-Object { $_ -match $re } | Select-Object -First 1

  $version32 = Get-Version $release.Version

  @{
    URL32         = $url32
    Version       = $version32
    RemoteVersion = $version32
  }
}

Update-Package -ChecksumFor none
