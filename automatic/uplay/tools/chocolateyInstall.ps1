$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '8E45D32EC8CE73B43E205349F44B44C4D26B4818A2E39A03FBF6BBA5E38C58CCD19B78ABDCD657CC2A0E53F62F8994788695636CB8EE6F2370EEA8DF1DCE5241'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
