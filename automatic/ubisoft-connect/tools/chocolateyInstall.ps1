$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'A3956E2DD550C62A33F2B0C4D4B233F5F4B8EFD42C4625B8F9FB928C7D25D5DB754369F28E8E18F1AA5D2BCCD346F828526A8549D987DFF8661965C9BBECEC64'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
