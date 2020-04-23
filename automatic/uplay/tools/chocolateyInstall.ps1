$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '37F881D66EFE9F67999B533889BB34F92169B27DB3CEBDD7D36BFAC8957647D6181E3F29048AC55B59A5CC4973F444C58D3931040CADA96E98E16631F43B6691'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
