$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://master.qt.io/official_releases/qtcreator/13.0/13.0.0/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://master.qt.io/official_releases/qtcreator/13.0/13.0.0/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = 'e869ae16cf8926380495c808514fd7a637a0c9881edd1fb6690ace35dccca373'
  checksumType   = 'sha256'
  checksum64     = '4591eef498f1a5808c7347f671b798ee13a17e20fb42075bb9235d613bf130d6'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
