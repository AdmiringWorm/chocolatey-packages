Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$repoUser = "persepolisdm"
$repoName = "persepolis"

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUri)>"
      "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_AfterUpdate {
  Update-metadata -key "releaseNotes" -value $Latest.ReleaseNotes
}

function global:au_GetLatest {
  $release = getLatestReleases $repoUser $repoName $false

  $url32 = $release.latestStable.Assets | ? { $_ -match '32bit\.exe$' } | select -first 1
  $url64 = $release.latestStable.Assets | ? { $_ -match '64bit\.exe$' } | select -first 1

  @{
    Version = $release.latestStable.Version
    URL32   = $url32
    URL64   = $url64
    ReleaseNotes = $release.latestStable.ReleaseUrl
    ReleaseUri   = $release.latestStable.ReleaseUrl
  }
}

update -ChecksumFor none
