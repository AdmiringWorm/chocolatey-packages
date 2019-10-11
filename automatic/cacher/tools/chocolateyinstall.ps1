$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.21.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'b5a6d3f210c62a412769eb3af72cb354d09cd1110e5e410baadb2d1ba00607f378b05a2ab6e0ace3c72508beafd08afe64aeb4c91a6a19cbac0f4a37819e33ed'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
