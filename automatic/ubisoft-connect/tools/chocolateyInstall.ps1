$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '2F3018966326CF44B44797CE8A33D7FBDE2945262D639CF0C5B8369428EF3C5A7F6F54EFD556BFB451BCA31EC6D0079FB6CD1DB3C52767AC17A546732BEDC43B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
