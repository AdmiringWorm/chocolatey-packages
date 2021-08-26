$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/5.0/5.0.0/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/5.0/5.0.0/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = 'a02022d7d32c443b1cb7e5ba197c19a058466f7633facf68d1cffab5d3fd1c5e'
  checksumType   = 'sha256'
  checksum64     = '56fdd37373b671ae8f521e229f1d60b0d27a1a4d88d1629d4b5d3c58a174b4dd'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
