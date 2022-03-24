$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://master.qt.io/official_releases/qtcreator/7.0/7.0.0/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://master.qt.io/official_releases/qtcreator/7.0/7.0.0/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = 'bab766725ba07a2741f45daff81e4d7dabb23bee02345be3b116a561c12c133f'
  checksumType   = 'sha256'
  checksum64     = 'efce77fe6526996e98dc4b6138f0c1b25a106decf00652d5be33e5e00b0c1902'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
