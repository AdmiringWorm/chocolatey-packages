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

  checksum       = '8CCF63C18A46F4464CE86B1E8A9D2063A6429F55BC49BE2A3FD76AE685327ACB0A947ECEA8CD66C28264AE4B5FACC1EAD9CC3C58F6B3614AB057F03C5467C112'
  checksumType   = 'sha512'
  checksum64     = '70DB3A38B4F4C86CE637FB232CABE2B70C908480D595B73FCC458B67FB8B770673ED8DDA93200B4AFFBF3F043009D69113CCDE4DAD920E0CA1D524317E0F9905'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
