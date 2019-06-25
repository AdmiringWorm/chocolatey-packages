$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '4AFBDD7B844955D17DB82EDEA19F54382DB5062D49E28DB2C4EA66B31B8A2C8D64DE718DD76EABB575CA549DC321AA517C73E19FE9DBD051EAE03D9B1BC12AA7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
