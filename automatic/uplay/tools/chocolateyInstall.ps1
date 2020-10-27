$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '8FB6754BC002A7EBF3CBD602AEEB80627130B6B0600549FBDB5961E3C4E23EFE68B09A53D925AAB55196528B295F8FDC220C3111911CFDC7FB90714356C7AF38'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
