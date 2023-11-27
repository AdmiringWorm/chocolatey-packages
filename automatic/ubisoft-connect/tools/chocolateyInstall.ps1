$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '43309E8A3C1BA7CEB50B54EDDE4D93BF46A12798B4E2A6728CB4B41EF4802E9A2FDFB35C1615EE71FD5FFCB1E2BA5F8B03DE5FFF4B2BC64A8BAEFD4B66C638F7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
