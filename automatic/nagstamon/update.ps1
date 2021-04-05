Import-Module AU

[uri]$releases = 'https://github.com/HenriWahl/Nagstamon/releases/latest'
if ($MyInvocation.InvocationName -ne '.') {
  $packageName = 'Nagstamon'
}

if ($MyInvocation.InvocationName -ne '.') {
  function global:au_BeforeUpdate {
    $content = Get-Content "$PSScriptRoot\..\nagstamon.install\Readme.md" -Encoding UTF8 | % { $_ -replace '(nagstamon)(?:\.install| \(Install\))', "`$1" }
    $encoding = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllLines("$PSScriptRoot\Readme.md", $content, $encoding)
  }

  function global:au_AfterUpdate {

    $releaseNotes = (
      "[Software Changelog]($($Latest.ReleaseNotes))  `n" +
      "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/nagstamon.install/Changelog.md)")

    Update-Metadata -key "releaseNotes" -value $releaseNotes
  }

  function global:au_SearchReplace {
    @{
      ".\$($Latest.PackageName).nuspec" = @{
        "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]*)`"" = "`$1`"[$($Latest.Version)]`""
      }
    }
  }
}
else {
  function global:au_SearchReplace {
    $replaceArgs = @{
      ".\legal\VERIFICATION.txt"      = @{
        "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseNotes)>"
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
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  #region Installer
  $re = '\.exe$'
  $urls_i = $download_page.Links | ? href -match $re | select -first 2 -expand href | % {
    [uri]::new($releases, $_)
  }
  #endregion

  #region Portable
  $re = '\.zip$'
  $urls_p = $download_page.Links | ? href -match $re | select -first 2 -expand href | % {
    [uri]::new($releases, $_)
  }
  #region

  $verRe = '/'
  [version]$version32 = $urls_i[0] -split "$verRe" | select -last 1 -skip 1

  @{
    URL32_i      = $urls_i | ? { $_ -match 'win32' }
    URL64_i      = $urls_i | ? { $_ -match 'win64' }
    URL32_p      = $urls_p | ? { $_ -match 'win32' }
    URL64_p      = $urls_p | ? { $_ -match 'win64' }
    Version      = $version32
    PackageName  = $packageName
    ReleaseNotes = Get-RedirectedUrl $releases
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}

