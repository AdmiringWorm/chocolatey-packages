$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '2C886B4B3484DBF6072D0B4B13DAB641841B2821FF02F7A9CCC9DF90B3FE53C971B144313305618A4A897F2CF6736E7BDD9222005DD9C1946977D9938DBBF225'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
