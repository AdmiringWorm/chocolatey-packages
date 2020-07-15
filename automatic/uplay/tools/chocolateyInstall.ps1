$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '3E2937C3743AFBE7C615120505F8945A7C3BC44CE014377679FF86B8EDA9B59F6A5E7C89AC0F4549F235741941627DA6E9FDE833412DF2C3400D07061E90A8D6'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
