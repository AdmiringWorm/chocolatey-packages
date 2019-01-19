$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.4.3.exe'
  softwareName   = 'Cacher*'
  checksum       = 'a8c349f79e2d031dce5ea4a2f4e63a3a1a18f350e3f42eeedae9a77f16f67f609df16a8d6f169da7f6661eefcbe64df03fcbe0ae48046b0a7a6b6f0d735125b4'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
