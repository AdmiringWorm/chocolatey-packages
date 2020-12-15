$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'A16F84FEDFC2ED3D4E558EB2CB92EB3A9824F899782EDE6F6F9491140BEED88D993D113A25C5DA16AD5C882B171EF909B0E993D66AFE28C7E14E6C21A1CD77D6'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
