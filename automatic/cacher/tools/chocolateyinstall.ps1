$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.47.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '90b2228b5df01e67259493b5a98f9d2beefe2e72b0528c672777905c3208aa39716b8f83017df0eef4624ac5a6b4dfddea2b18eda100a42db27179405575ff0f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
