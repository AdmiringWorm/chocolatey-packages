$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '5E2C074D59A2DE1595F15EA9AE89E30B31623467620DD27C6CBF72468147FDE95EC46AB882A4727A936AF06EA1501F8675B93D23DBC9ABD6FE66823952A77426'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
