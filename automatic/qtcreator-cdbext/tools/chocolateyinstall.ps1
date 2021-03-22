$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.14/4.14.2/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.14/4.14.2/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = 'd4e13f82c3c05c44e6b84cdeecad3f981efd7e64d8e035adb92b06c0e2878264'
  checksumType   = 'sha256'
  checksum64     = 'b088ab352b2e9b7f6770ece96c8c930c576776637a38c17d93c396327e48db97'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
