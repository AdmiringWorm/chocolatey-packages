$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '0ADCBA6EE85D1E493A8401A3B2ED6FA60283937AD859B1626E2183D8EED0B2DE10BDAD7D0C6528A567C954C3DFBC48FBF0E26D9BB78105324996B535B1FC639B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
