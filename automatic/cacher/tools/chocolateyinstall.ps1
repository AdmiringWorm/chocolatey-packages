$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.5.exe'
  softwareName   = 'Cacher*'
  checksum       = 'a8c83dd877bc7dcd1c8391babfb677074510b07971efb3fb8c8cddb04e3ed8cc9efbf0cc71fd062d2fba043b85d4a6e8bd2a1a13ae1799c0fe7f89c27c20ed30'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
