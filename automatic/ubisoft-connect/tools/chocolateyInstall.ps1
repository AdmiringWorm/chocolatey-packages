$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'CBC4642276D3A55382D2C52341B52D24CE869A1DAAB9973151AE6F6896B0AAC30C8DA5AA999131EBAD9886FB3021AEC6EAD987AEA0AD26477228F794A40D054F'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
