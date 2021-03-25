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

  checksum       = '5DC30609EA3DEA2E8F8D874B2520F80B96B6EADC30DEC6214A162182D115A4975353D2F9E906E4DF014158DAE221EA0C363DD397104977C7BEC385245EAE117B'
  checksumType   = 'sha512'
  checksum64     = '13970F731D25BFC8DE2BE424436E19EDEFC8107FFCA10E91E57392D1B62B01B5285AA43E1063DB9678CE783A65D64C5D8A39608E218D2B898E936A17911FCFDA'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
