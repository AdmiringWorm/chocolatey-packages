$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://master.qt.io/official_releases/qtcreator/10.0/10.0.0/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://master.qt.io/official_releases/qtcreator/10.0/10.0.0/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '51c66e59a6df6b3b2e320268c2a3f9e9da055955c66a1c1d0f13e0a892886645'
  checksumType   = 'sha256'
  checksum64     = '7e65a44c1b5a8c8eb0d5efcd4dc989d327720adeef40d459c15c2b6db1d4e72d'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
