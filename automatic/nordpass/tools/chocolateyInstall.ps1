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

  checksum       = '2AD0E020B41E53B85F61A41A45576EEAEE0CAF1E9D0E0E33A92009CCC1E35D97102A3535BBF6175758C788448C1D2B14364D0EE6FDC096A34FC77C41E7BE7656'
  checksumType   = 'sha512'
  checksum64     = 'F8F430851446197B117C69D5211E03D1216A31F2176E6AA3E312B968B191F9A2C5502CE30CAF0AF1BCEBCE99EA9F4C904316172862331F1A5D392CF79F5C8E29'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
