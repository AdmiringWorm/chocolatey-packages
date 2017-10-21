Import-Module AU

$releases = 'https://nagstamon.ifw-dresden.de/download/'
if ($MyInvocation.InvocationName -ne '.') {
  $packageName = 'Nagstamon'
}

if ($MyInvocation.InvocationName -eq '.') {
  function global:au_SearchReplace {
    @{
      ".\legal\VERIFICATION.txt"      = @{
        "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
        "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
        "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
        "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
        "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
        "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
      }
      ".\tools\chocolateyInstall.ps1" = @{
        "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
        "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
      }
    }
  }
} else {
  function global:au_SearchReplace {
    @{
      ".\$($Latest.PackageName).nuspec" = @{
        "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]*)`"" = "`$1`"[$($Latest.Version)]`""
      }
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  #region Installer
  $re = '\/stable.*win32.*\.exe$'
  $url32_i = $download_page.Links | ? href -match $re | select -first 1 -expand href
  $re = '\/stable.*win64.*\.exe$'
  $url64_i = $download_page.links | ? href -match $re | select -first 1 -expand href
  #endregion

  $verRe = '[-]'
  $version32 = $url32_i -split "$verRe" | select -last 1 -skip 1

  $result = @{
    URL32_i      = [uri]$url32_i
    URL64_i      = [uri]$url64_i
    Version      = [version]$version32
    ReleaseNotes = "https://github.com/HenriWahl/Nagstamon/releases/tag/$version32"
    PackageName  = $packageName
  }

  return $result
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}

