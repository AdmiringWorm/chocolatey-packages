$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '9663D90F1A9AE8737CF7691BE8792E04ADE5F17EE833F745D73C8DEEDD70BF49C72D09BE40FD68199F388E1643F7FC758813E71BA4D652FC9DBE6ECA3537D31B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
