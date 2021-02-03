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

  checksum       = '0BE7501F705B763BC6CB2DAA15EADBDEF174B6D36717266D27C3E4FF5E50012821BC6062D3B4CCB8C3FCE378F95F7446E1CECD49EC7C35AE43489EE91528C850'
  checksumType   = 'sha512'
  checksum64     = '2E736506E28DD2CC6191E6B1EBF1A0FE70611C611C0E6DA31B3000C78618DDAEF92F60DABE68F939620D501A67AD678F7F5C734CD998A89D19E8F0352E14E8B5'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
