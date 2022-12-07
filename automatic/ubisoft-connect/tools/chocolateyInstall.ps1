$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '7BCBE4727FEB31EE9D07C24B7D410A5D1B1D20A485CC40216795F2F81EDC688E9CADE8ADEB03E4B1157338EC93F9BDC6FDAA0BC1DA222AA0CC1153E9E47A44C6'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
