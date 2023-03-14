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

  checksum       = '18F5D570322C9538BF3D838CEC68EA83BF93047AE606DEAFB63C3DBF93F7B2A1D464E4DB68F0F94045EB74866D0E9707FFD84C0D45D0FDF68864B6AF7AD5699F'
  checksumType   = 'sha512'
  checksum64     = 'DCFFF0AB6F8A0D397EF249BAFEA773F6CDA6F546CBBF7CDE4A452725631086C9C1EAA92D58B713648109261BF0CBF8CA7542234738CA72A92FE7D81B86A0D726'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
