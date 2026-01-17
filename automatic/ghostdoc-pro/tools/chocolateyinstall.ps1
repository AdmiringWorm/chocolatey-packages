$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.com/download/ghostdoc/pro/registered/'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Pro'
  checksum       = '06b0f9f9adbe0a19a9a5a05bdd178c192ab6de5f8243c73af4e68de39b825f75f5306b701e4adeff08804d6249c0736513bac67f93af5529a34ae6e13278eb3a'
  checksumType   = 'sha512'
  silentArgs     = ''
  validExitCodes = @(0)
  options        = @{
    Headers = @{
      Referer = 'https://submain.com/download/ghostdoc/pro/'
    }
  }
}

[array]$existingKey = Get-UninstallRegistryKey @packageArgs
$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

if ($existingKey.Length -eq 1) {
  $existingKey | ForEach-Object {
    . "$toolsDir\helpers.ps1"
    Write-Host "Uninstalling previous version of GhostDoc Pro"
    UninstallGhostDoc "$($_.PSChildName)"
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs["file"] = Get-ChildItem $cacheDirectory -Filter "*.exe" -Recurse | Select-Object -First 1 -ExpandProperty FullName

if ($env:chocolateyInstallOverride -ne $true) {
  Start-Process "autohotkey.exe" "$toolsDir\ghostdocInstall.ahk","Pro"
}
Install-ChocolateyInstallPackage @packageArgs
