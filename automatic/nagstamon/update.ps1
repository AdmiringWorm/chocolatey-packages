Import-Module AU

$releases = 'https://nagstamon.ifw-dresden.de/download/'
if ($MyInvocation.InvocationName -ne '.') {
  $packageName = 'Nagstamon'
}

if ($MyInvocation.InvocationName -eq '.') {
  function global:au_SearchReplace {
    $replaceArgs = @{
      ".\legal\VERIFICATION.txt"      = @{
        "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
        "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
        "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
        "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
      }
      ".\tools\chocolateyInstall.ps1" = @{
        "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
      }
    }

    if ($packageName -eq 'nagstamon.install') {
      $replaceArgs['.\legal\VERIFICATION.txt']["(?i)(\s*32\-Bit Software.*)\<.*\>"] = "`${1}<$($Latest.URL32)>"
      $replaceArgs['.\legal\VERIFICATION.txt']["(?i)(^\s*checksum(32)?\:).*"] = "`${1} $($Latest.Checksum32)"
      $replaceArgs['.\tools\chocolateyInstall.ps1']["(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"] = "`${1}$($Latest.FileName32)`""
    }
    return $replaceArgs
  }
} else {

  function global:au_BeforeUpdate {
    $content = Get-Content "$PSScriptRoot\..\nagstamon.install\Readme.md" -Encoding UTF8 | % { $_ -replace '(nagstamon)(?:\.install| \(Install\))',"`$1" }
    $encoding = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllLines("$PSScriptRoot\Readme.md", $content, $encoding)
  }

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
    #URL32_p      = [uri]($urls_p | ? { $_ -match 'win32' } )
    URL64_p      = [uri]($urls_p | ? { $_ -match 'win64' } )
    Version      = [version]$version32
    PackageName  = $packageName
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}

