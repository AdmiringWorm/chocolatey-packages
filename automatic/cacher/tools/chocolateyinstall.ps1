$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.6.exe'
  softwareName   = 'Cacher*'
  checksum       = '96a99dfd9130fd7b3cfb5939a5931ed3a9b401a3109057ae42876709f96c2ea4dfa9f27e5d39e58e683888b6a80f774f2d416eec91c09f6c0c5058537c97caa7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
