Import-Module AU

$releases = 'https://gitlab.com/api/v4/projects/sheepitrenderfarm%2Fclient/releases'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^[$]packageClientPath\s*=\s*`"[$]packageToolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_GetLatest {
  $release = Invoke-RestMethod -Uri $releases

  $version64 = Get-Version $release[0].tag_name

  $url64 = "https://www.sheepit-renderfarm.com/media/applet/sheepit-$version64.exe"

  @{
    URL64   = $url64
    Version = $version64
  }
}

update -ChecksumFor none
