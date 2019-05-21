$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '07DBFDA1B79633115867C723616BAADAB424625EC65390529646663E30F4EB9EE9EFC9F6ED18C0D3A0F2D644256795C81B2F2CC41EADF9767B48BFD3501905D8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
