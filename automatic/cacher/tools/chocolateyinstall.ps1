$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.11.exe'
  softwareName   = 'Cacher*'
  checksum       = '063f1e48416c19d8076c01e141bd080d7f755147831fff893ed28401891f6256e471296295cfdc8386ea0d0d2c801e0f59f91901b6e40da1156103af8caa7261'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
