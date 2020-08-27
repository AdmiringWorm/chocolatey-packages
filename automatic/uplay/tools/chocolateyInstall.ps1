$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '741F6E8894A34DA19B8D018509E57A8E1F5C5267001248A2B309397300F84E9772159EFE0B9664253A53F6C507D5F4CCC01BA4E3FEB88DF23D4E973AA2DA8856'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
