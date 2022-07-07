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

  checksum       = '5564C72A67C40C71276F318766A0CD98A305B617BDF6C5BCD12D45E911240511854D1E6A2A2F8C5D6D39F318928821A522FBC4EFDB1EB3763BA1C75DB652C102'
  checksumType   = 'sha512'
  checksum64     = '2EC8317725DA439C70F4B24C91F0D8821A6A9CC7E9ADAD43F0DF5B2BA8B456EB67040A882F93F07B1095EBA41F4B58CED384F1438AB70E5FFDF9F3B0119EE409'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
