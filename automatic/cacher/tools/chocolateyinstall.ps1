$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.7.exe'
  softwareName   = 'Cacher*'
  checksum       = '7a5cdcb9635e594a537740ea6a7522dc256f6b0d5a1bea61ede59566eff803a656bde146a8e604fb157047ad377854872180e015ba8bccf10bc82e7902e2a79b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
