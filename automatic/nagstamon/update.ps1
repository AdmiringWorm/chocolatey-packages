﻿Import-Module AU

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
  $re = '\/stable.*\.exe$'
  $urls_i = $download_page.Links | ? href -match $re | select -first 2 -expand href
  #endregion

  #region Portable
  $re = '\/stable.*\.zip$'
  $urls_p = $download_page.Links | ? href -match $re | select -first 2 -expand href
  #region

  $verRe = '[-]'
  $version32 = $urls_i[0] -split "$verRe" | select -last 1 -skip 1

  @{
    URL32_i      = [uri]($urls_i | ? { $_ -match 'win32' } )
    URL64_i      = [uri]($urls_i | ? { $_ -match 'win64' } )
    URL32_p      = [uri]($urls_p | ? { $_ -match 'win32' } )
    URL64_p      = [uri]($urls_p | ? { $_ -match 'win64' } )
    Version      = [version]$version32
    PackageName  = $packageName
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}

