Import-Module AU
Import-Module "$env:chocolateyInstall\helpers\chocolateyInstaller.psm1"

$releases = 'http://submain.com/download/ghostdoc/pro/registered/'
$referer = 'http://submain.com/download/ghostdoc/pro/'
$softwareName = 'GhostDoc Pro'

function global:au_AfterUpdate {
  $info_page = Invoke-WebRequest -UseBasicParsing -Uri "http://submain.com/products/ghostdoc.aspx"
  $Latest.ReleaseNotes = $info_page.Links | ? href -match "whats-new-in-ghostdoc" | % href

  $releaseNotes = ("[Software Changelog]($($Latest.ReleaseNotes)  `n" +
    "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/ghostdoc-pro/Changelog.md)")

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

  @{
    URL32   = Get-RedirectedUrl $releases -referer $referer
    Version = GetVersion
  }
}

function GetVersion {
  $rss_feed = Invoke-WebRequest -UseBasicParsing -Uri "https://blog.submain.com/category/news/"
  $link = $rss_feed.links | ? { $_.href -Match "Released" -and $_ -match "ghostdoc" } | select -first 1 -expand href

  $page_data = Invoke-WebRequest -UseBasicParsing -Uri "$link"
  $match = $page_data.Content -match "GhostDoc v([\d+\.[\d\.]+) update is"
  if ($match) {
    return $matches[1]
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl
}
