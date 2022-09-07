$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '7D25B580CC882BCDB2DFC6BDD84D92B4B815156D54F975B5A8ECAEA1517E54DD157BD21B1229BEAB1CAAC6000778FDB4C0E2ED4694B0523657AD26EAECD501B6'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
