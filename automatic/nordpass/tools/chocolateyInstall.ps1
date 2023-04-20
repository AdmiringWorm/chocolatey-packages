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

  checksum       = '877DA14A309BF339A49149BF146D0854135D820AD1C452BA4AEA6AAB37978B11422FAC5701EE597E6176D2DCE90FDF5E7BF0541E6A0471BAF20060BA5F30F509'
  checksumType   = 'sha512'
  checksum64     = '129600E085A18C8755FDB49275A96D99C883139B67869C2FD4E9D81A1A63C24AACAF1604751AC5CA477A9E62905E1C4DEE605D1FFAB71A5AB8AC5C1973F43F89'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
