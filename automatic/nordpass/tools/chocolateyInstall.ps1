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

  checksum       = '5A8D712FFFDD466547A075D5E0CF63C52725BA47C8E580159EF4257673801A0892ACFEC7DFC01ED080C08FAF3872CEAFFC0B41ABE635F56AF2BA5765861BF525'
  checksumType   = 'sha512'
  checksum64     = 'E4B7F5D4A757D9503DACD7DAFC187E1021677808827E549B3B39164D2D1304F54FAD3AAC8312220EB80DD638A720529D2E8D2EA934D77FC70E70E8FD3769F740'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
