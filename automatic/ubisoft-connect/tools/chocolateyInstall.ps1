$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'E8CBFC3E0126A78E4F04159893F6AA2F23FCB46F9CE81A15A4BE4428C6BD89A77638EB2D63E6A498630A7DFE4435A720EB2A0D0C7EB4DE7A63EE99E5FB5E3483'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
