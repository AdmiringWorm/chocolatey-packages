Import-Module Chocolatey-AU

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
  $release = Get-LatestGithubReleases -repoUser 'HenriWahl' -repoName 'Nagstamon' | % latest

  #region Installer
  $re = '\.exe$'
  $urls_i = $release.Assets | ? { $_ -match $re } | select -first 2
  #endregion

  #region Portable
  $re = '\.zip$'
  $urls_p = $release.Assets | ? { $_ -match $re } | select -first 2
  #region

  $verRe = '/'
  $version32 = Get-Version $release.Version

  @{
    URL32_i      = $urls_i | ? { $_ -match 'win32' }
    URL64_i      = $urls_i | ? { $_ -match 'win64' }
    #URL32_p      = $urls_p | ? { $_ -match 'win32' }
    URL64_p      = $urls_p | ? { $_ -match 'win64' }
    Version      = $version32
    PackageName  = $packageName
    ReleaseNotes = $release.ReleaseUrl
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}
