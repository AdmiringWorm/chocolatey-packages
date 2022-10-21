$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://master.qt.io/official_releases/qtcreator/8.0/8.0.2/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://master.qt.io/official_releases/qtcreator/8.0/8.0.2/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = 'bddb808500d2ec0a20ed582028d7bb63ff5f2e6be8b280b30dc9e98d33a969d6'
  checksumType   = 'sha256'
  checksum64     = 'e29a1e5c451396e7b4b908ed375ad4beb04359d89579f5f4ca417210f2c7c8e8'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
