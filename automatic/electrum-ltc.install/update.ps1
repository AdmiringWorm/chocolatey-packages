. "$PSScriptRoot\..\electrum-ltc\update.ps1"

$releases = 'https://electrum-ltc.org'

function global:au_BeforeUpdate {
  cp "$PSScriptRoot\..\electrum-ltc\Readme.md" Readme.md -Force
  $content = gc Readme.md -Encoding UTF8 -Raw
  $content = $content -replace '(packages\/electrum-ltc)\)', '$1.install)'
  $content = $content -replace '( electrum-ltc)\]', '$1.install]'
  $enc = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText("$PSScriptRoot\Readme.md", $content, $enc)
  $Latest.URL32 = $Latest.URL_I
  $Latest.ChecksumType32 = 'sha256'

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  $softwareName = 'Electrum-LTC*'
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"          = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"       = "`${1} $($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"`[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*softwareName\s*=\s*)'.*'" = "`$1'$softwareName'"
      "(?i)(^\s*packageName\s*=\s*)'.*'" = "`$1'$($Latest.PackageName)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)(\s*\-SoftwareName\s*)'.*'" = "`$1'$softwareName'"
      "(?i)(^[$]packageName\s*=\s*)'.*'" = "`$1'$($Latest.PackageName)'"
    }
    ".\$($Latest.PackageName).nuspec" = @{
      "(?i)(^\s*\[Software Changelog\]\().*(\))" = "`${1}https://github.com/pooler/electrum-ltc/blob/$($Latest.RemoteVersion)/RELEASE-NOTES`${2}"
    }
  }
}

update -ChecksumFor none
