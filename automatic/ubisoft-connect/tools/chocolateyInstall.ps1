$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'ED3BDB50D30EE31C2BDBE7A74CED48CD220E37B849A9E4ADF05515821D2755E0C1286597830D8EC02F2BF0D9419B12137FE4F31E720DAFC4EE577E2201A36952'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
