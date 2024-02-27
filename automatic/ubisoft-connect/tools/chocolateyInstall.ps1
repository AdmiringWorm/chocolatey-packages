$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'F3E19D23D6353BAA02F48138AAC452BDDEF44B8607ECF16AEF1A4957112B5C62FB51B67972582181ED055B4DEB5B8C0CD6890769C9BF0ED67F12BEC66D1E3FDF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
