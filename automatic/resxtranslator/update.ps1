Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$repoUser = 'HakanL'
$repoName = 'resxtranslator'
$domain   = 'https://github.com'
$releases = "$domain/$repoUser/$repoName/releases/latest"

function Get-RepositoryLicense($repoUser, $repoName) {
  $headers = @{}
  If (Test-Path Env:\github_api_key) {
    $headers.Authorization = "token " + $env:github_api_key;
  }

  $response = Invoke-RestMethod -Uri "https://api.github.com/repos/$repoUser/$repoName/license" -Headers $headers

  return @{
    Url = $response.html_url
    Content = [System.Convert]::FromBase64String($response.content)
    SPDX = $response.license.spdx_id
  }
}

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $licenseInfo = Get-RepositoryLicense "$repoUser" "$repoName"

  [System.IO.File]::WriteAllBytes($licenseFile, $licenseInfo.Content)

  if ($licenseInfo.SPDX -ne 'GPL-2.0') {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  $Latest.LicenseUrl = $licenseInfo.Url

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Update-Metadata "licenseUrl" $Latest.LicenseUrl
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseURL)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(LICENSE\.txt.*)\<.*\>"        = "`${1}<$($Latest.LicenseUrl)>"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^\s*packageName\s*=\s*)'.*'"  = "`${1}'$($Latest.PackageName)'"
      "(?i)(^[$]filePath\s*=\s*`"[$]toolsPath\\)[^`"]*`""= "`${1}$($Latest.FileName32)`""
    }
    ".\resxtranslator.nuspec" = @{
      "(?i)(^\s*\[Software Changelog\]\().*(\))" = "`${1}$($Latest.ReleaseURL)`${2}"
    }
  }
}
function global:au_GetLatest {
  $release = Get-LatestGithubReleases -repoUser 'HakanL' -repoName 'resxtranslator' | % latest

  $re = 'signed\.zip$'
  $url32 = $release.Assets | ? { $_ -match $re } | select -First 1

  @{
    URL32 = $url32
    Version = Get-Version $release.Version
    ReleaseURL = $release.ReleaseUrl
    LicenseUrl = 'https://github.com/HakanL/resxtranslator/blob/master/LICENSE'
  }
}

update -ChecksumFor none
