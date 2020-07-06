$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.31.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '63f22af2a7c4216b9f35708293929e5470276f07d0b32d1be674e98d2ea6a9f658d645b046ed78fdfbac17f3e19159036dc01cb3fa6ed803dbb6aa9fec181b33'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
