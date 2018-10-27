$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e968209c8db030eb2e04893bcb58d778529c8bf75df6babce37be4563235a4449f5f5c90b28353e26f9cda5506cc032015bf36d6a4719362864f3fcda73bf002'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
