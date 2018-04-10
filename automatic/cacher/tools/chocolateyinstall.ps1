$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.14.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c57f2cb1b42c8de4999a597f18b55b88496542f85e3791b7b624c40985eb0dd5d4783a3fd4e891433c0fecf21223f4ada9d38551604c71ac3334d98934bd6ad9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
