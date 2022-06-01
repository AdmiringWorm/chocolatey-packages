$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '521B8525975366599B0716BCDADB9AF72D4EB5B7D36F82075CC016F9C78D44803D6FEC0470D18A2CE76AB4A088E5DADB18A2CCBFB24B40E70DDAB54F3EBD8930'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
