$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://master.qt.io/official_releases/qtcreator/9.0/9.0.1/installer_source/windows_x86/qtcreatorcdbext.7z'
  url64bit       = 'https://master.qt.io/official_releases/qtcreator/9.0/9.0.1/installer_source/windows_x64/qtcreatorcdbext.7z'
  destination    = "$installToolsPath\qtcreator"
  checksum       = '1e99b0556652edd05f6490c71c5d6e80767034f042309e28aa998927579bab13'
  checksumType   = 'sha256'
  checksum64     = '899c02174e16f2732c3e56e7828fae6d7953b94e2303e9b24e5e15f2ca795ef7'
  checksumType64 = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
