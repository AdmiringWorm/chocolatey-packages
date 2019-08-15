$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '5EB4B2168D63B90F636CF7B38CB3964F986AB4D105D6392DCBF6438A3B347C15BA439BA68833496B687A517AC47F9D9E68755AD9EDF001E8C3FE92B49015AA98'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
