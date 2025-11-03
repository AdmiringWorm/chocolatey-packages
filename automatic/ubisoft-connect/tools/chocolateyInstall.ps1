$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'F885DAFD6097A2C3B580DBD6C35579B070E021FCF441FCFFBF0C2EBBB4AF709388B928557196C934ED3AB2E07FF5A703DEA4B885BFE781C6352DFD0EF1BFB1D2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
