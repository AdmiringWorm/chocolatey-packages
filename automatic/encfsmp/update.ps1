Import-Module AU

$releases = 'https://encfsmp.sourceforge.io/download.html'
$softwareName = 'EncFS MP'

function global:au_BeforeUpdate($Package) {
  $content = iwr -UseBasicParsing -Uri ($Package.NuspecXml.package.metadata.licenseUrl -replace 'blob','raw') | % Content

  $isCorrectLicense = $content | ? { $_ -match 'MIT license' } | select -first 1

  if (!$isCorrectLicense) { throw "License has changed, please update..." }

  Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1
}
function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>"       = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"                    = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"           = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"             = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
    }
    ".\tools\chocolateyuninstall.ps1" = @{
      "(?i)(^\s*softwareName\s*=\s*)'.*'"       = "`${1}'$softwareName'"
    }
  }
}

function GetStableStream($download_page) {
  $re = '\.exe\/download$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $_ -replace "^(ht|f)tp\:",'https:' }

  $verRe = '\/'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 2
  return @{
    URL32 = $url32
    Version = $version32
    FileType = "exe"
  }
}

function GetPreReleaseStream($download_page) {
  $re = "Beta\:\s*\<a[^\>]*href=`"(?<url>[^`"]+)`"[`\>]*\>"

  if ($download_page.Content -match $re) {
    $verRe = '\/'
    $url32 = $Matches['url']
    $version32 = $url32 -split "$verRe" | select -last 1 -skip 2
    return @{
      URL32 = $url32
      Version = $version32 + "-beta"
      FileType = "exe"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $streams = @{}

  $streams.Add("stable", (GetStableStream $download_page))
  $prereleaseStream = GetPreReleaseStream $download_page
  if ($prereleaseStream) { $streams.Add("beta", $prereleaseStream) }

  return @{ Streams = $streams }
}

update -ChecksumFor none
