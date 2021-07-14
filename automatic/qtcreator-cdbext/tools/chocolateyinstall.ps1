$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.15/4.15.2/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.15/4.15.2/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '29d4a9f978773b2f5a3f7357bbaf66faef103fb7abd1d400ffe3080ec92ae0a3'
  checksumType   = 'sha256'
  checksum64     = 'f393b2aa81270b298c66d10cab7eac64cff95881712afa0589c06bc57445c1db'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
