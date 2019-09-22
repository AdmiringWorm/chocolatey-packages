$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.19.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '3ea333e464bb397ef5d952eb3aed8781bc7d69de2dcb18aa202d50604de946bef8fb11c3939e86a166922da7ae3edb3deb1aa99d4c34b46d8b54da3935f8a0c9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
