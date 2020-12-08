$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.35.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '2069545803e184675836fb52c8e20b4360ebdd6bc5c85730bf05fb7b3ede973cc76e10c2291c850399a10053d5431d5bf04b2459f876d93b4858ab7098f31c67'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
