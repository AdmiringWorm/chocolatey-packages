Import-Module AU
Import-Module "$env:chocolateyInstall\helpers\chocolateyInstaller.psm1"

$releases = 'https://submain.com/download/ghostdoc/pro/registered/'
$referer = 'https://submain.com/download/ghostdoc/pro/'
$softwareName = 'GhostDoc Pro'

function global:au_AfterUpdate {
  $info_page = Invoke-WebRequest -UseBasicParsing -Uri "https://submain.com/products/ghostdoc.aspx"
  $Latest.ReleaseNotes = $info_page.Links | ? href -match "whats-new-in-ghostdoc" | % href

  $releaseNotes = ("[Software Changelog]($($Latest.ReleaseNotes)  `n" +
    "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/ghostdoc-pro/Changelog.md)")

  Update-Metadata -key "releaseNotes" -value $releaseNotes
  Update-Changelog -useIssueTitle
}

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha512'
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Headers @{ Referer = $referer } -Algorithm 'sha512'
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
    URL32   = $releases
    Version = GetVersion
  }
}

function GetVersion {
  $download_page = Invoke-WebRequest -Uri $referer -UseBasicParsing

  $download_page.Content -match "Build\:\s*v?([\d\.]+)" | Out-Null

  if ($matches) {
    return $matches[1]
  }
  else {
    throw "Unable to get version information"
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl
}
