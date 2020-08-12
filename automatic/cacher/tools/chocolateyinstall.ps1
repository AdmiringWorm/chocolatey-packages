$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.32.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '6b3ee8c66f00f8860b646899705b571732c69b805ad6301760b250ce4fe4da8a9fc4d9b1772bcbc7cdbea57925f204a8dbb150a9ef6908f42dd46d556e9837e3'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
