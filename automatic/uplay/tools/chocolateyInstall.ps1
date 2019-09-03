$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'A415F4C7FC226067CEC7C6DD25B5BD315E3018C7E28D12295AE4F498D56C1BED6CE3D6859339A5FA7102990981285571283D6AD2650D7604A2CC5359A666F01D'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
