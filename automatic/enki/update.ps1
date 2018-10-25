Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$softwareName = 'Enki*'
$repoInfo = @{
  repoUser = 'andreikop'
  repoName = 'enki'
}

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUrl)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"             = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\)[^`"]*`"" = "`${1}$($Latest.FileName32)`""
    }
  }
}
function global:au_GetLatest {
  $latest = Get-LatestGithubReleases @repoInfo | % latest

  @{
    Version    = $latest.Version
    URL32      = $latest.Assets | ? { $_ -match '\.exe$' }
    ReleaseUrl = $latest.ReleaseUrl
  }
}

update -ChecksumFor none
