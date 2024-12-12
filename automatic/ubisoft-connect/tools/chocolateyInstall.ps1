$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '37BE6C9129D96CEAE30ECEC286A22B9EBB4FF71BF73FDD9FEBDE0A5BAEAB347BE768E127065027370746CF95C9F095D3443DDE9E4E137F166F68FB50C88DEA42'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
