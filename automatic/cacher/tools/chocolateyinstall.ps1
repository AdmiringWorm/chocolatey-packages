$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.12.3.exe'
  softwareName   = 'Cacher*'
  checksum       = 'af44c6e0651564953391ff279b03a4505a039204bf1646a49b813a4824137a8c6c15eb9ef80e9b2f96e3a7daeb9608b9586d603b4e1e584d25c6383d2f3185a7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
