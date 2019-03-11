$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '487eb1354a5eda31d4f1072788d3e368b75f0d1752420acbce4e7ba7533d55efabce25d1f76407c5bfadd3e577aca694439ff00b1f9e3792f3bb63a2fee661ac'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
