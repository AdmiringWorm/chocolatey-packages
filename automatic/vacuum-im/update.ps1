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
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.msi$'
  $urls = $download_page.Links | ? href -match $re | select -first 2 -expand href | % { 'https://github.com' + $_ }

  $verRe = '\/'
  $version32 = $urls[0] -split "$verRe" | select -last 1 -skip 1
  @{
    URL32        = $urls[0]
    URL64        = $urls[1]
    Version      = $version32
    ReleaseNotes = Get-RedirectedUrl $releases
  }
}

update -ChecksumFor none
