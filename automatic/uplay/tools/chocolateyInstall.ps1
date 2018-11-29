$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '6AFD8F4C1C097F11150F2BD4A96F581FAE59FD8CC259B8EED8FDBA3CDDCD8A138E790B8C8FB0BA9E174EB39513C9A6EF5416585216805C94AA3D0DE6704F14E3'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
