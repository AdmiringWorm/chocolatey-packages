$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.14/4.14.0/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.14/4.14.0/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = 'bbe56f7f9c7e483b6f6c473245a36940dd0a74cb6cf9603929c6504dce7a98e6'
  checksumType   = 'sha256'
  checksum64     = '93f6616b4d35f5c0de0a5d93f11160fd38848d9821cf6d58f71349117eafd6be'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
