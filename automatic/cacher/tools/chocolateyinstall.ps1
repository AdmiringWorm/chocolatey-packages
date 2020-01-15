$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.22.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '5e1c220f9f5a66410b2e7af03d7e23d899160e66be43481d7746fd8b853364cdd872ded27a8e9cd478bc664105b0dbd9ec21bb78e98f4b097856836926d35a0a'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
