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

  checksum       = '0CE51FE70BC0CDE6C2F318580E7C9B257A37153A7B107F962ECB34CE3728A57033C22463EAF43F26667C5086E20EABA7CE328B9D1A18B2A7CF75C2037D8080C8'
  checksumType   = 'sha512'
  checksum64     = 'D372C2FBA458046A08CB1655B366CD4753DD268C10CB142FC8A0ECAABB79BD63566239D6500358F828AD00F66519966DAE8A758CF8FC940C3BBFBDC6B1725732'
  checksumType64 = 'sha512'

  # MSI
  silentArgs     = "/S /D=$installDir"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
