$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.4.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '189a8530ae2783973ca0fc4456cc3415281588541748fd025a3f66e1c504c898c1e8b65d4f266718d69d6bfa87a1bc698b50a769a82db780cbbcfd4d90d06425'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
