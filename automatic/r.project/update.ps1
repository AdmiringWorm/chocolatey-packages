. "$PSScriptRoot/../r/update.ps1"
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$softwareName = 'R for Windows*'

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha256'
  Get-RemoteFiles -FileNameBase $Latest.FileName32.TrimEnd('.exe') -NoSuffix -Purge
}

function global:au_AfterUpdate {
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"        = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"        = "`${1} $($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"`[$]toolsDir\\).*`""        = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)(^\s*packageName\s*=\s*)'.*'"  = "`${1}'$($Latest.PackageName)'"
    }
    ".\r.project.nuspec"            = @{
      "(\<id\>).*(\<\/id\>)" = "`${1}R.Project`${2}"
    }
  }
}

update -ChecksumFor none
