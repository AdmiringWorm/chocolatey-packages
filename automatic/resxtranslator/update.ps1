Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$domain   = 'https://github.com'
$releases = "$domain/HakanL/resxtranslator/releases/latest"
$licenseUrl = "https://github.com/HakanL/resxtranslator/blob/master/src/Licence.txt"

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -DontAppendArch

  # Lets download the latest url
  $Matches = $null
  $licenseUrl -match 'https?://github.com/([^/]+)/([^/]+)/(?:blob|raw)/[^/]+/(.+)' | Out-Null
  $owner = $Matches[1]
  $repo  = $Matches[2]
  $path  = $Matches[3]

  $json = Invoke-RestMethod -UseBasicParsing "https://api.github.com/repos/$owner/$repo/contents/$path"
  $sha  = $json.sha

  $licenseOutput = "$PSScriptRoot\legal\LICENSE.txt"
  Remove-Item $licenseOutput
  Invoke-WebRequest -UseBasicParsing -Uri "$($json.download_url)" -OutFile "$licenseOutput"
  if ((gc $licenseOutput -Encoding UTF8) -match "GNU General Public License") {
    $Latest.LicenseUrl = "https://github.com/$owner/$repo/blob/$sha/$path"
  } else {
    throw "License type have changed, please verify it still allows distribution"
  }
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
      "(?i)(^\s*\<releaseNotes\>).*(\<\/releaseNotes\>)" = "`${1}$($Latest.ReleaseURL)`${2}"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases

  $re = 'signed\.zip$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $domain + $_}
  $re = '\/releases\/tag\/v[\d\.]+$'
  $releaseUrl = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $domain + $_ }

  $verRe = '\/'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32 = $url32
    Version = $version32.TrimStart('v')
    ReleaseURL = $releaseUrl
  }
}

update -ChecksumFor none
