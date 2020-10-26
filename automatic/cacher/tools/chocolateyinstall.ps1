$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.33.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '4e1267ec63ee54678bfe80e97027ff47814f38ca281884cdaf4d3ee7c7cef17975934a0e2354907dde2951a28a75e5ad4cfe0e8d0a035bc37c3f243897059916'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
