$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.6.exe'
  softwareName   = 'Cacher*'
  checksum       = 'ae75e3e2bf217236f7ae58fe7fcf9bfe7576dd9d4ba342cebce993334709d25387b87c0983a37d121bd4a2350b962e5b411f1f667f3c3514f679c7c53a8ca037'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
