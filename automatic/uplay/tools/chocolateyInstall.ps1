$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'C2ABB1FC96BAE583E359766A0303E41C68453E3D4E383C7282E707D74B8A71A3BF7E5F342CDDF7932E24DADCE815AF34DB3D4AAB2607CD09A81BFB9FD740D94E'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
