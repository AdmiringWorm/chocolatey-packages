$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.13/4.13.2/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.13/4.13.2/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '45f0103f3a5946ef61e828dac346699e54a30d9f6671a3eb7bb0b9a8777910c1'
  checksumType   = 'sha256'
  checksum64     = 'bd096cc7278b5229787966b45d55409301c8e2c4771080e26737c72ef5b10be7'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
