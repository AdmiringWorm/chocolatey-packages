$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.8.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'e1fa655e498d1006f560944286dfe9701b18f767d5d88d84985a95ead8ac2b6f1a5f7ac8c82bae5382b7364be02d922ecefa2a07ff473c931f291bce278752db'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
