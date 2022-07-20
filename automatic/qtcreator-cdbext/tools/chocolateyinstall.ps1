$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://master.qt.io/official_releases/qtcreator/8.0/8.0.0/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://master.qt.io/official_releases/qtcreator/8.0/8.0.0/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = 'd48cdc162c17798ae9829f292b7bfd3c6ccb81c2153ee390d2d2b681744591f4'
  checksumType   = 'sha256'
  checksum64     = '6c9ef1251cda70e20214f83f3565114e67a7af183d3b03961eefdfa4b7c79622'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
