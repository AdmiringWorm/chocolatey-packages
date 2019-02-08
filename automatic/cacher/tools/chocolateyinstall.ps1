$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.8.exe'
  softwareName   = 'Cacher*'
  checksum       = 'bec9f755112113efee959444aa2a1514d6ee9c42b800338d9d5c9f4cf5f5d8a0111532042ae6d88b3261a374b8268d3ff64622126d5e7ce00336c2cf37fb167f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
