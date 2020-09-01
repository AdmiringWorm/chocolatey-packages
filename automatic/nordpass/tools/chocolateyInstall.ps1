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

  checksum       = 'EB44E27DC83364B7CFF65A6D5FC71A6638A7C90C2A482C8422873E2CE3F7F9195EEFC000D96E78CEFE6C9FF4756A0F02E060045096FD7B024B4DF242187AC24A'
  checksumType   = 'sha512'
  checksum64     = 'AC4F2E0857D0642838A55015AF15BA9FBA5F897309532CC219333B0224CC3717399BA72141C65AE8E4E63D17333BD376471C65E795DDA815284F9E73E0C96D93'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
