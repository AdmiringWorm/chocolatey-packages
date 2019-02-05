Import-Module AU

$releases = 'https://marketplace.visualstudio.com/items?itemName=RandomEngy.UnitTestBoilerplateGenerator'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(studio gallery\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"             = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"        = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"             = "`${1} $($Latest.Checksum32)"
    }
    '.\tools\chocolateyInstall.ps1'   = @{
      "(?i)(^\s*File\s*=\s*`"[$]toolsPath\\)(.*)`"" = "`$1$($Latest.FileName32)`""
    }
    '.\tools\chocolateyuninstall.ps1' = @{
      "(?i)(^\s*VsixId\s*=\s*)'.*'" = "`${1}'$($Latest.VsixId)'"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  $releaseChangelog = @"
[Software Changelog](https://github.com/Microsoft.UnitTestBoilerplateGenerator/blob/master/CHANGELOG.md#$($Latest.RemoteVersion -replace '\.'))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/unit-test-boilerplate-generator/Changelog.md)
"@
  Update-Metadata -key "releaseNotes" -value $releaseChangelog
}

function GetVsixIdFromManifest() {
  $manifest = New-Object xml
  $manifest.Load("https://github.com/Microsoft/UnitTestBoilerplateGenerator/raw/master/src/source.extension.vsixmanifest")

  $id = $manifest.PackageManifest.Metadata.Identity.Id | select -First 1
  return $id
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases

  $json = $download_page.Scripts | ? class -eq 'vss-extension' | Select-Object -expand innerHtml | ConvertFrom-Json | Select-Object -expand versions
  $url = $json.files | ? source -match "\.vsix$" | Select-Object -expand source -first 1

  $version = $json.version | Select-Object -first 1

  @{
    Version = $version
    URL32   = $url
    VsixId  = GetVsixIdFromManifest
  }
}

update -ChecksumFor none
