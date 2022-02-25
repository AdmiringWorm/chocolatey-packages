$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.43.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '53028cf241218bf7db5c9386bac28f927168504d688099a09a6f3e69ecfe743c581aa4990c9912ee98ae760422d530315d099506deb55a071119617a1ad48abb'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
