$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.9.exe'
  softwareName   = 'Cacher*'
  checksum       = '85f435c6848b36497e703459824f70d735f3b097ec70ce6d4910a59e5a1a76a896241350f8336376d717451ed1c02bd3c3a4210bb43297f83551255a8645979a'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
