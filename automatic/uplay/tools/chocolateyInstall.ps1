$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '33910F48E5D162CA534F5281391887AD8C803D5DBA408D51847E2EEFB5ABE1DB766B9697AD2D479C88B78925AA6CA07D1CF059FBEBEA96C3B6815C26195261D8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
