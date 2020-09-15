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

  checksum       = '3AF1FFE5DBE6FE3CF74177020BBB85CE518A708943CC9170FA912E47C0B46E073AE99FC805F615005E5A1CE0550B0DFA511B1654855484367F932B032F438B48'
  checksumType   = 'sha512'
  checksum64     = '6F1A6409471E18E4A498BC9ECB950685615CAFB4892895F8EA79D0BC28C82D49FA4151343A2E6C0602FE9A5BBB189F8DED31BB6BC3EB974A947B6B4AD17780CB'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
