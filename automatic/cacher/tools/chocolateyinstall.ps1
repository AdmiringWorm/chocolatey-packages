$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.10.exe'
  softwareName   = 'Cacher*'
  checksum       = '33503cb79a343a425b2d1269a384b59d77a5ad0e7c17c5b55d4ebef780d007a64b270d19fcffbcab7369f28bba7db562239b845be33c509836bc5f4676923e76'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
