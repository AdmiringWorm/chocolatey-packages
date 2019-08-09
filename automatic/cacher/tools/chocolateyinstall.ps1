$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.14.7.exe'
  softwareName   = 'Cacher*'
  checksum       = '2737a895155eb62a0de68c3736940efa253e4e1cc0601a70dde8bb3cb4f093c4c887f7df5e454fc8cd341465b7943072c4a9d1d6c5a12a22cc7f6520dbeb99a7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
