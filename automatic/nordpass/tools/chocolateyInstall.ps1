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

  checksum       = '0BF82BE39B0EB94D9F30A9F85B942EAAFA810A75C035124947F3C4A504AC34DB9F5E731BBD6DA5951571F65C004422DA1595BED1BFD5E94E9C65FBB4C8D79884'
  checksumType   = 'sha512'
  checksum64     = '4FA7F213CB034515406D4D50D5571E15DC7291A5FB21281B36CB60D4CF487C0B72054EB6CD829F0E00BAA6EAB0E769EE178C48013890F748FE20A098A4217A25'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
