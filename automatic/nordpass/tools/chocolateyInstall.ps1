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
  checksum64     = 'BC2EB2C8A033A25C902095E8AE7D0288471253292A00E6E44D130A6CA5661A06B7573044BAFC6B0FD849CE8C84139AB1F297A3E56767392A73A14A3DD270C962'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
