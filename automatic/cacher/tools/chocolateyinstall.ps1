$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.38.3.exe'
  softwareName   = 'Cacher*'
  checksum       = 'fa05589759b40b530008d829c2108944696c89ff9de78e62a992bf9323578b003005526631636d9e8bde8c9ec5b1b3413fe2f9c4ecc825a84edd67fe98a7a1ee'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
