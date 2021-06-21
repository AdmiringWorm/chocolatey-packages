$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'FEA6F28479E35A9CA9D526E7C056947EB642A0EF3B6B2DB691AF0181144338A33AF5421E79BE8A48E27B9A6498BAEA7D339FE1C0EBA367856714BEBF1D0D7632'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
