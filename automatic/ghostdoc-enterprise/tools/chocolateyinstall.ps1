$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.com/download/ghostdoc/enterprise/registered/'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Enterprise'
  checksum       = '73d151d3f9faeaa56bda19e836db4e8e379dc2f206c8b6442cea601992857973f689c2d677ed4919bb24b666b92b7eebaa8e301f9dcd4a416a2a49776200662b'
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
