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

  checksum       = '4F3BB7E477E0ED071C00D2C94CFCA12B2DCD420B2F749105E76819864029B54F3A7BEAC50DC157D5A224DEF15627B58BF41511A1E7446FDC6CBBBB0FFB83C438'
  checksumType   = 'sha512'
  checksum64     = '92C4B93D41B3AE9546AA7377F5D213E864E1B23784704A79D4FF8BAEDD094361068E79DC145BF4B6EAB2641A13C9088F961717C0A907575CF7D9E9AAE9E139BE'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
