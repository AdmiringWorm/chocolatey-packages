$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.11.exe'
  softwareName   = 'Cacher*'
  checksum       = 'c02284d141acd9dab9442ba33f0d14a1a2ee486213658043b80618a18085b17ed3223f4a476e01cdcf3a5c935202709186a4e8edceb582228924d8b724980af0'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
