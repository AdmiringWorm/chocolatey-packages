$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '814509CDB9BC437ECA055AA51E75B4560BE33D10A2ABCF28CAC644C27D41290AB04AB9C34822148E7FA55B811DB0920C74FFC76671672C20D44E28C6F2D3BD52'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
