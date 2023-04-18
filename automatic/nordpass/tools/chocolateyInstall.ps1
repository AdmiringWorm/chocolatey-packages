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

  checksum       = '651C1B82B6E9834676984C1E81BCF6914513DCADC08B7EDF014F52653D33AFA819A39F016A4183FA569388F5E4E690A94760DBBAC584DE73BE17BEDDE5CC44B1'
  checksumType   = 'sha512'
  checksum64     = 'B02C08D7D1C8F8B48AE837E4F55E19D70843837DCB7028A96D9D482B2974B30628AA65F008F12B27BB54642AF954AB7882676E9DCE0CE5A7175791D37DC0AE73'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
