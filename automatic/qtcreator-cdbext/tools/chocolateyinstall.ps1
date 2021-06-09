$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.15/4.15.1/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.15/4.15.1/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '9520463b32a28da591569e2e2b9e50676e8435f29211332b0b89155bc357321b'
  checksumType   = 'sha256'
  checksum64     = '62f1a4831ea0a69d39fbae2c487e938de349761d060ec7ad16de2cbf29739a8e'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
