$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.13/4.13.3/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.13/4.13.3/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '771f253d41b2f2979910f963075135daba2889e6b0836d327b9163dafde33bbb'
  checksumType   = 'sha256'
  checksum64     = '51e59578b1dc7900ef8c9d027fc6fca3bf3c7e26132417cee146f088f385c85b'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
