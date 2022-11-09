$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '01D2ED768C48012351BE5F3A54020C7DB4D670330A110CFBDFFB0F741F2339DAEE15C410FB795298AC3BBC846D9FEA426446DF559C9A3CEEF7A1CFCD76D63FFF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
