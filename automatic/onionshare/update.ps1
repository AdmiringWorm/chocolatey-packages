Import-Module Chocolatey-AU

$releases = 'https://github.com/micahflee/onionshare/releases'
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
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function forceDomain([uri]$releaseUrl, [string]$fileUrl) {
  return New-Object uri($releaseUrl, $fileUrl)
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.msi$'
  $urls = $download_page.Links | ? href -match $re | select -expand href | % { forceDomain $releases $_ }

  $streams = @{}

  $urls | % {
    $url32 = $_
    $verRe = '\/v?'
    $version32 = $url32 -split "$verRe" | select -last 1 -skip 1 | % { $_.TrimStart('v') }
    $stableRe = "^([\d\.]+)$"
    $unstableRe = "^([\d\.]+)\.([a-z-][a-z\d-]+)$"

    ($name, $version) = if ($version32 -match $stableRe) {
      ("stable", $Matches[1])
    }
    elseif ($version32 -match $unstableRe) {
      ("unstable", "$($Matches[1])-$($Matches[2])")
    }
    else {
      ("", "")
    }

    if ($name -and !$streams.ContainsKey($name)) {
      $streams.Add($name, @{
          URL32         = [uri]$url32
          Version       = Get-NormalizedVersion (Get-Version $version)
          RemoteVersion = $version32
        })
    }
  }

  @{
    streams = $streams
  }
}

update -ChecksumFor none
