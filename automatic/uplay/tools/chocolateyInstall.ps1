$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '0C77D2448E76663A7C284D1ED3928B232FE5209A63D7206B3B592AD011AC056BF4084F5CB706AD99A1E1C41B429ACBB8E1D4DB3D09AE5E2890B5116536FC1F14'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
