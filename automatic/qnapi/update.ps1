Import-Module AU

$releases = 'https://qnapi.github.io/#download'
$softwareName = 'qnapi*'

if ($MyInvocation.InvocationName -ne '.') {
  function global:au_BeforeUpdate {
    $content = Get-Content "$PSScriptRoot\..\$($Latest.PackageName).install\Readme.md" -Encoding UTF8 | % { $_ -replace "($($Latest.PackageName))(?:\.install|( |%20)\(Install\))", "`$1" }
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
else {
  function global:au_SearchReplace {
    $replaceResult = @{
      ".\legal\VERIFICATION.txt"      = @{
        "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
        "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
        "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
        "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      }
      ".\tools\chocolateyInstall.ps1" = @{
        "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
      }
    }

    if ($Latest.PackageName -eq 'qnapi.install') {
      $replaceResult[".\tools\chocolateyInstall.ps1"]["(?i)^(\s*softwareName\s*=\s*)'.*'"] = "`${1}'$softwareName'"
      $replaceResult.Add(".\tools\chocolateyUninstall.ps1", @{
          "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
        })
    }

    return $replaceResult
  }
}

function global:au_AfterUpdate {
  if (Test-Path ".\Changelog.md") { Update-Changelog -useIssueTitle }
  $packageNameChangelog = if ($Latest.PackageName -eq 'qnapi') { 'qnapi.install' } else { $Latest.PackageName }
  $fullReleaseNotes = @"
[Software Changelog]($($Latest.ReleaseNotes))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/$packageNameChangelog/Changelog.md)
"@
  Update-Metadata -key "releaseNotes" -value $fullReleaseNotes
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url32_i = $download_page.Links | ? href -match $re | select -first 1 -expand href
  $url32_p = $download_page.Links | ? href -match '\.zip$' | select -first 1 -expand href

  $verRe = '\/'
  $version32 = $url32_i -split "$verRe" | select -last 1 -skip 1

  @{
    URL32_I      = $url32_i
    URL32_P      = $url32_p
    Version      = $version32
    ReleaseNotes = "https://github.com/QNapi/qnapi/releases/tag/$version32"
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}
