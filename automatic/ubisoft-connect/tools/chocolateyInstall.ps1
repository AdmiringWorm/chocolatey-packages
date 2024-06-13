$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'A2435DE3674A72FF3E2F89AC39805AB10B6F89D3DD776FC143D14AC6226AF2BC019B50B06010FE08763A9BBC6FFFABAE49BEE5D15B5BED7B16293BC0890F5557'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
