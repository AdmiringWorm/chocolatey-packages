$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '7CC2BA48C43DA8706F0E9B782144CC6D29D1D7541BC82C165C3293F7AD5FDB9E2815B71860963E18D6FDF9C0175FD8A516EB159D49EEB5D49201E3A0C5548D9C'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
