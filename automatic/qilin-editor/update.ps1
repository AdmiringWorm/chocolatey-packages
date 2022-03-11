Import-Module AU

$releases = 'https://github.com/qilin-editor/qilin-app/releases'
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
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'windows\.zip$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://github.com' + $_ }

  $verRe = '\/v?'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1

  @{
    URL32         = $url32
    Version       = $version32
    RemoteVersion = $version32
  }
}

update -ChecksumFor none
