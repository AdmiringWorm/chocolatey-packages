$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'B5CFEF7462D83E7206A54AF550E97CE96F6949D03940740A9CF35BB652E11A18DFE99C028B9A4F81F52CE5D1236A40CF967842D9866AD50590242D9260A2B7FF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
