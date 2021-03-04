$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path $(Get-ToolsLocation) "NordPass"

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.npass.app/windows_x86/NordPassSetup_x86.exe'
  url64bit       = 'https://downloads.npass.app/windows/NordPassSetup.exe'

  softwareName   = 'NordPass*'

  checksum       = '07C6EFADB08397998C6FED697FAD828222B6401A15ED63D0EDBEA96F8B7DCE0D90A667366A99535E3F2A580615F6F69C4492FB626FE416315862DF98FB0557B0'
  checksumType   = 'sha512'
  checksum64     = 'D0997565F353B2309667FEBDAD6C3B4634B7D2B30B2396E50278D4A0D90BBCDEEE9C0E3A7F0E46296C937D4F287457F6B2CD3CBE9263014903838ED91890192F'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
