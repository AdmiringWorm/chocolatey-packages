Import-Module AU

$repoInfo = @{
  repoUser = 'cmderdev'
  repoName = 'cmder'
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUrl)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_AfterUpdate {
  Update-Metadata -key 'releaseNotes' -value "
[Package changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/cmdermini/Changelog.md)

### Software changelog
$($Latest.ReleaseNotes)
  "
}

function global:au_GetLatest {
  $release = Get-LatestGithubReleases @repoInfo | % latest

  return @{
    Version      = $release.Version
    URL32        = $release.Assets | ? { $_ -match '\.7z$' }
    ReleaseNotes = $release.Body
    ReleaseUrl   = $release.ReleaseUrl
  }
}

update -ChecksumFor none
