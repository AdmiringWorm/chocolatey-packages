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

  checksum       = '81E83C38FC1E03C027A31C6E0CCF39ECEE883D31AC9A0D1A1D1B5F1E06D20D313D75F10DA6FE093341FC78C8968778E8321397DDCF546AAB887128DF70729195'
  checksumType   = 'sha512'
  checksum64     = '5945F20427EB5673722A9E05F17BDB9CDCF77347AAD30E696AC68ED98C43B6721B456D0B82D2AB1CE82F6C0048E84298DB23313F99ED51239212ED845414CB20'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
