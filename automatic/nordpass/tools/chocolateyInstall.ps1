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

  checksum       = '5CB0E269700F78984FE4638A488F4AA9BC0C8266AC9C8C9FCA1115FF4160BFC9C26F0C5FCB7D21F1254EFB47491AF7C4BD47F7D38BB7D74F6E9493B16FDB0AC1'
  checksumType   = 'sha512'
  checksum64     = '7E28D06DF9F5E268EDB4EDECF35A7CA0192598B4BF5F7E9856A9D2623BBB35C73F2C4BACCEB845496F513BE0337E7B10C4D425A7C4318E63C5B5121A1072C8B4'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
