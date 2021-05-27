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

  checksum       = '638D33AE4B97858F3D02473AED91B506285C815C2744E25E45B563866F7A7F17E26254BBD2135F89FA7FD284B0FDAD9DAD1C34E744A75293158961C8D9C152F0'
  checksumType   = 'sha512'
  checksum64     = '2A490621096D392CD4E0072FE25573FEBE9DCECA287D28FF49BB2ABFF59F8C124629C1C3D557FB9BA42D17A2CA15680242CF4756D5543229E1448D5D65D31F59'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
