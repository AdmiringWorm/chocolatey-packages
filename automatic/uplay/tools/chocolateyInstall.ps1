$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '8A65EC032008317D3940740F290DAB7EA75AF601580AE722AB35159FEA104847D5D7E75ABC48AEA1F12ADB066E2D4784B291A0EF005B9DB714938D5C896125D7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
