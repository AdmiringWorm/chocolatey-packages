$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'FD758C640F2FCCD3E039D82BAA4C0941697EB78475F2FDCD1746652EF6B3AD03CAC5803CEBDD7537675122DEF7BF453FFE547AEAB92F441E2C39519ABD96F94E'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
