$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.33.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '8d615b8d66cc809771f7538136056d3e2ee0eb2638c1c470cf8b5b81d438c6928775c498bed3d07d9be111edd3f808a73c843f2e49ce83854cc5d8ea595416dd'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
