$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '4502A7EF23AA5076E2F01E37A36FD01DE0A5FCD95A31F5E1074A03D914785F9AE0E36FE075C209470B4C0216B0C44EF943A6D274AD20BA99B6B2BEBF57C4BB0B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
