$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.16.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '92aa043614df621c4d131932a5022b46f78ea36f14bfc27b3140838a28cc25cf6ef90c5c45d20592151728b426e4ddf836fb75a5aaf94a73a499983fab72899b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
