$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.19.4.exe'
  softwareName   = 'Cacher*'
  checksum       = 'ecf2a219b4bb41a32880649d4095f223add8073eb7a59128dcc02930fb9d15c22fa515c8eb1ba3f82f8589d6eb83a6a4305c04047212b927601affcc898e5b8c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
