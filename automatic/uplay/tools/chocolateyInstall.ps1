$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '5ABA6F40A4A4D626ED6184B4B9451505DCFED3899F9D6AEC79698FF72B9FB5305BD27C3588E4D4BABE46FF24E8DF422341057A785E41994D3C23B84182CE4FDF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
