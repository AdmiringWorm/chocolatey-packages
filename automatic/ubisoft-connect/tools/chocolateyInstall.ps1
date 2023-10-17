$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '4847228E31F978A4472F85C3E8E4C2D299C9E5D98D3E4CC9B1E42D92A6E9F6900115E9D3A9753AF875B08A2817CA4BEA5FC0F06559F63000F1C5004C46F94682'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
