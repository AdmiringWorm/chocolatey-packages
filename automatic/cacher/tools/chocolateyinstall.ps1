$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.16.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '44d4eb9afaf4c2e63699a233bfc7c968cdd1f90adadc93c2a4a5ba7e5bd819fb8a39d8edaa68f8c324a696c7cb92b39c27e90a7b1e03e9bd7bcc8738d6bd4110'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
