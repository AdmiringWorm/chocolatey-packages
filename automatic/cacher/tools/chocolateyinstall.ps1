$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.0.10.exe'
  softwareName   = 'Cacher*'
  checksum       = '1f520df7d8d5bb52fa509adb97f19b79dcec07ed342b53c2b25ebd7d447b4ee8f833bbf4567faf3f6f133bd1b5eb2239753c45cefc740cae272a57b900d1761f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
