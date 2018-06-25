$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.9.exe'
  softwareName   = 'Cacher*'
  checksum       = '2a9ba0a3904972a3b556a713b4a93ab9333e7d121e634add0a8cbe35c90f0e94571c47938c105d2113e5d6d4bec0b9a1bba52be330994d0d2efbd060e3a01a7c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
