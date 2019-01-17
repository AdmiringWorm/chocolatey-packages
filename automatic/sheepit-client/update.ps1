Import-Module AU

$releases = 'https://www.sheepit-renderfarm.com/getstarted.php'
$softwareName = 'sheepit-client*'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
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
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url64 = $download_page.links | ? href -match $re | select -first 1 -expand href | % { 'https://www.sheepit-renderfarm.com/' + $_ }

  $verRe = '[-]|\.exe$'
  $version64 = $url64 -split "$verRe" | select -last 1 -skip 1

  @{
    URL64   = $url64
    Version = $version64
  }
}

update -ChecksumFor none
