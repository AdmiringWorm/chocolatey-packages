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

  checksum       = 'B7762E688476598A21830BE148AE83EBD99576BA0CDB27D777F7C7BBC0F1905215E16B9C408F21830C39180E26E68D6716A7E47F48CCA1547EAD7BD7CC610926'
  checksumType   = 'sha512'
  checksum64     = '63AE91A5615FD79BE861D543F462B73EDC4FDA8D35AED333EE84E026576C152E2A3BE25038EBA9DEFEA64FB7C3CA38D7139D237F1CCBE5577D03F9D861E3F5E7'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
