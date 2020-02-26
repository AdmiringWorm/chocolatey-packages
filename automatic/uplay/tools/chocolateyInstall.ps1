$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '93DBA15A8081BB4AFF474078C85D1527F8C5D16BFCB4C412C23ED179C3E944893A6E6431294FA3B56533B356082AFC9B9A9C32C507073BB211A26B9E1C18FB09'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
