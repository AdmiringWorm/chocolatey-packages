$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'B210FF2E7BC93871C1A7C0EFCF385E31E64587B24EF0DDF3B6E5DD60D70ACC215054CDA001C152E697D1BB68C87FF297E9514E5CAFDD5F601AB2B11606897AD6'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
