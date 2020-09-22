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

  checksum       = '51415E6911327D4EDA4C159EE3B8FDCD0BE299E3ED58BC70E672227FE1826558917EE9F5E6B888526E515021B9A0897115B28EB586779346D86158CF57C816F8'
  checksumType   = 'sha512'
  checksum64     = '88A5D7993D94CB978D30EDB3EC6A94E46923E1641512B0D5B60E8E763ED2AD6F95ED39100E1AF336ACA9139DB696A78E890C46CC2901EF8E2552EA1585282480'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
