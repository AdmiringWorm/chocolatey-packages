$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '9C0556722DE3F7818818C5AC756EA3D7CAE1DB2A379CC03E818F6EFFB93BDD68E282C2A12605C7727730A86712F09ECA5E6AFF32598A44AB09A2150A94490172'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
