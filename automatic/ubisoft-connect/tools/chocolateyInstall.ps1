$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '9CF5D59CB36A9CB333E3DF602E062E51DAF61E9EE1B6010E74EDF18B77D9468EC08159031A102E5D3FD13967637E061EAB8179E80BC599B3C6564FA1BAEEAF73'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
