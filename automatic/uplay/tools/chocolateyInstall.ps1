$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '51FB6C360F134028AE4DB8FB9E909F14CA4A57080250015639914AF78BEEAB4DCEB5419E6B257C3E73AAED79546D5D8FA0122EF48E567E3B143AEDCBC0EDD0BC'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
