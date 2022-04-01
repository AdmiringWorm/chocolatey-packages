$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.com/download/ghostdoc/enterprise/registered/'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Enterprise'
  checksum       = 'bd2180c26971f39f698961aee1f65b0afe0a6dafae212cc7518e24c8d66ccb009f35b8f2430888aa17e242a4fc19e35b667c7f5b75d39fc220135752261e2771'
  checksumType   = 'sha512'
  silentArgs     = ''
  validExitCodes = @(0)
  options        = @{
    Headers = @{
      Referer = 'https://submain.com/download/ghostdoc/enterprise/'
    }
  }
}

[array]$existingKey = Get-UninstallRegistryKey @packageArgs
$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

if ($existingKey.Length -eq 1) {
  $existingKey | ForEach-Object {
    . "$toolsDir\helpers.ps1"
    Write-Host "Uninstalling previous version of $($packageArgs.softwareName)"
    UninstallGhostDoc "$($_.PSChildName)"
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs["file"] = Get-ChildItem $cacheDirectory -Filter "*.exe" -Recurse | Select-Object -First 1 -ExpandProperty FullName

if ($env:chocolateyInstallOverride -ne $true) {
  Start-Process "autohotkey.exe" "$toolsDir\ghostdocInstall.ahk","Enterprise"
}
Install-ChocolateyInstallPackage @packageArgs
