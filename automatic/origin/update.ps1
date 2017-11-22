Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$padUnderVersion = '10.5.5'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix

  $file = "$PSScriptRoot\tools\$($Latest.FileName32)"
  $productVersion = Get-Item "$file" | % { $_.VersionInfo.ProductVersion -replace ',', '.' }
  Remove-Item -Force $file
  if ($productVersion -ne $Latest.RemoteVersion) {
    throw "The download executable do not have the same version as the one we parsed.`nActual Version: $productVersion`nParsed Version: $($Latest.RemoteVersion)"
  }
}

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)'.*'"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)'.*'"     = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)'.*'" = "`$1'$($Latest.ChecksumType32)'"
      "(?i)(\s*\-version\s*)'.*'"         = "`$1'$($Latest.RemoteVersion)'"
    }
  }
}

function global:au_GetLatest() {
  $versionParseUrl = 'http://www.filehorse.com/download-origin/'
  $download_page = Invoke-WebRequest $versionParseUrl -UseBasicParsing
  $download_page.Content -match 'Origin\s*([\d]+\.[\d\.]+)' | Out-Null

  $version = $Matches[1]

  return @{
    URL32          = 'https://download.dm.origin.com/origin/live/OriginSetup.exe'
    Version        = Get-PaddedVersion $version -OnlyBelowVersion $padUnderVersion
    RemoteVersion  = $version
    ChecksumType32 = 'sha512'
  }
}

update -ChecksumFor none
