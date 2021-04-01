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

  checksum       = 'CAACB4F9336858E81284138F26AA8865C4595ADBBDA87201F73886D8D9AFFF50511BE4C8A121E77B4A5F7E5CEA0848A3F0F97DD2AF72FEDD23E42544B85C812A'
  checksumType   = 'sha512'
  checksum64     = '59863530F6646B423C1CA3D7866519AD8403FBEEE0DD9DC0398B7EB1F128051887147CBBDE4FC1931EE249E88D9D94247C5F069C351EA653B82585E990E0508F'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
