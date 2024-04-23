$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '954E182FB868010F3A8525743A2EE765CDC96DC9875312B30D2E886D9C66AA8B454F0A6A4F97F5CB3AA13883C1168214B6A06E6BA5318B62BD8B7A92C740B21D'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
