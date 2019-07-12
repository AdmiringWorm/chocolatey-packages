$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.12.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '6b5a1a9afc1dd6f12ea02475bb6f0181f6676567cea870d9aee06cbced54caa019ac7559bdf0eaaa59588bf7fd9206f63f27c50a566f7a47d0df3f59ec8ba935'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
