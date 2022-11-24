$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://master.qt.io/official_releases/qtcreator/9.0/9.0.0/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://master.qt.io/official_releases/qtcreator/9.0/9.0.0/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '62cab76cd971bda51cb69d36cad1ea3cee6686129d4b1addb2ac97d694c1fdd3'
  checksumType   = 'sha256'
  checksum64     = '67fbb368d0da2f05dc223b0e8f5b4f5c7ce8207e7e462ae3cb5d8ddd6104a8e3'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
