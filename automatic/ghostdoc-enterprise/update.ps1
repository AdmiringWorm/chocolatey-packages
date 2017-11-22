Import-Module AU
Import-Module "$env:chocolateyInstall\helpers\chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'http://submain.com/download/ghostdoc/enterprise/registered/'
$referer = 'http://submain.com/download/ghostdoc/enterprise/'
$softwareName = 'GhostDoc Enterprise'

function global:au_AfterUpdate {
  $info_page = Invoke-WebRequest -UseBasicParsing -Uri "http://submain.com/products/ghostdoc.aspx"
  $Latest.ReleaseNotes = $info_page.Links | ? href -match "whats-new-in-ghostdoc" | % href

  $releaseNotes = ("[Software Changelog]($($Latest.ReleaseNotes)  `n" +
    "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/ghostdoc-enterprise/Changelog.md)")

  Update-Metadata -key "releaseNotes" -value $releaseNotes
  Update-Changelog -useIssueTitle
}

function global:au_BeforeUpdate {
  $tmpFile = [System.IO.Path]::GetTempFileName()

  Get-WebFile $Latest.URL32 $tmpFile -options @{Headers = @{ Referer = $referer}}

  $Latest.ChecksumType32 = 'sha512'
  $Latest.Checksum32 = Get-FileHash $tmpFile -Algorithm $Latest.ChecksumType32 | % Hash

  Remove-Item $tmpFile
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"          = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*referer\s*=\s*)'.*'"      = "`${1}'$referer'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)(\-SoftwareName\s+)'.*'" = "`${1}'$softwareName'"
    }
  }
}
function global:au_GetLatest {
  $url32 = Get-RedirectedUrl $releases -referer $referer

  $verRe = '_v|\.zip'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1

  @{
    URL32   = $url32
    Version = $version32
  }
}

update -ChecksumFor none -NoCheckUrl
