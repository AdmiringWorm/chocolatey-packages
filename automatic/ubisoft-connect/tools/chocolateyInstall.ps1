$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'E0DE3794513998CDA767B6B936CAF34A0C4FB2D83A4A09951F260B164CD6FCCCE644AF454E2977359B3BA18F1A458DB9775B5447ABBBCCAEA0C04AC1770BE678'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
