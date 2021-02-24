$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.14/4.14.1/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.14/4.14.1/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '5f5f756fd141524f0cf2bce4c4cb34b5bda01c420d00ff246b1e09951201ab98'
  checksumType   = 'sha256'
  checksum64     = 'ab4d9574a478c53376c953651274624ef77222a9fa84db5c82271ee92e18fc18'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
