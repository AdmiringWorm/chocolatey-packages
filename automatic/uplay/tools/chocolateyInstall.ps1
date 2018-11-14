$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '65A10216C9BFFC3047F2D74729A087F469FB1BF845AE474814C6F8F5ADA7398308B49B889D915A394BDA6D2E9A38652F14AB43B6D64DD2528006ED37B7E6E715'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
