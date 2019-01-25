$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'http://submain.com/download/ghostdoc/pro/registered/'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Pro'
  checksum       = ''
  checksumType   = ''
  silentArgs     = ''
  validExitCodes = @(0)
  options        = @{
    Headers = @{
      Referer = 'http://submain.com/download/ghostdoc/pro/'
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
