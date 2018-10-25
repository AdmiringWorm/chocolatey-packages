$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = ''
  softwareName   = 'coq*'
  checksum       = ''
  checksumType   = ''
  checksum64     = ''
  checksumType64 = ''
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
