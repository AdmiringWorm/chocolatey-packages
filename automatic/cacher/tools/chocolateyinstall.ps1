$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.7.2.exe'
  softwareName   = 'Cacher*'
  checksum       = 'abdabf71e963635ac06b4ec7a4697520d3a114319c3f3d43c5be840f933a06ec615eaf4587408bd7eac5d8ff5d3d10cd263f7b208065e6f1c15afe95ee2be903'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
