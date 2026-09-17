Import-Module Chocolatey-AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://github.com/onionshare/onionshare/releases'
$softwareName = 'OnionShare'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $newLicenseUrl = $Package.nuspecXml.package.metadata.licenseUrl -replace '\/master|\/v[^\/]+', "/v$($Latest.RemoteVersion)"

  iwr -UseBasicParsing -Uri $($newLicenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  $Package.nuspecXml.package.metadata.licenseUrl = $newLicenseUrl

  Get-RemoteFiles -Purge -NoSuffix
}
function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum(64)?\:).*"       = "`${1} $($Latest.Checksum64)"
      "(?i)(The file 'LICENSE\.txt'.+)\<.*\>" = "`${1}<https://github.com/onionshare/onionshare/blob/v$($Latest.RemoteVersion)/LICENSE.txt>"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $githubReleases = Get-AllGithubReleases -repoUser 'onionshare' -repoName 'onionshare'
  $streams = @{}

  $githubReleases | ForEach-Object {
    [array]$urls = $_.Assets | Where-Object { $_ -match '/OnionShare-win64-[^/]+\.msi$' }
    if ($urls.Count -eq 0) { return }
    if ($urls.Count -ne 1) { throw 'Expected exactly one OnionShare win64 MSI per release.' }

    $url64 = $urls[0]
    $remoteVersion = ([uri]$url64).Segments[-2].Trim('/').TrimStart('v')
    $stableRe = '^([\d\.]+)$'
    $unstableRe = '^([\d\.]+)\.([a-z-][a-z\d-]+)$'

    ($name, $version) = if ($remoteVersion -match $stableRe) {
      ('stable', $Matches[1])
    }
    elseif ($remoteVersion -match $unstableRe) {
      ('unstable', "$($Matches[1])-$($Matches[2])")
    }
    else {
      ('', '')
    }

    if ($name -and !$streams.ContainsKey($name)) {
      $streams.Add($name, @{
          URL64         = [uri]$url64
          Version       = Get-NormalizedVersion (Get-Version $version)
          RemoteVersion = $remoteVersion
        })
    }
  }

  if (!$streams.ContainsKey('stable')) {
    throw 'No stable OnionShare win64 MSI release was found.'
  }

  @{ streams = $streams }
}

update -ChecksumFor none
