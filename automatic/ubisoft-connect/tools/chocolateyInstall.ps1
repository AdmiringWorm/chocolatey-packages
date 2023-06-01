$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'BA36EA22B5EF4D863A451C172DF2DDDA4728455A14E483F22A4EE6D353C64D6D4C1F8F037D6E33722F42F9033DCC352F2B04BEA684C55F990AAD030CF66BF677'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
