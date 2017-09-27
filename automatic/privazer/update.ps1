Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://privazer.com/download.php'

function global:au_SearchReplace {
  @{
    ".\$($Latest.PackageName).nuspec" = @{
      "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '.exe$'
  $urls = $download_page.Links | ? href -match $re | select -first 2 -expand href | % { 'https://privazer.com/' + $_ }

  $url_i = $urls | ? {$_ -match "_free"} | select -first 1
  $url_p = $urls | ? {$_ -notmatch "_free"} | select -first 1

  $Matches = $null
  $download_page.Content -match "PrivaZer v([\d]+\.[\d\.]+)(?:\<span[^\>]+\>)?([\.\d]+)?" | Out-Null
  if (!$Matches) { throw "Version was not found" }
  if ($Matches[2]) {
    $version = $Matches[1] + $Matches[2]
  } else {
    $version = $Matches[1]
  }

  @{
    URL_I = $url_i
    URL_P = $url_p
    Version = $version
    ChecksumType32 = 'sha512'
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}
