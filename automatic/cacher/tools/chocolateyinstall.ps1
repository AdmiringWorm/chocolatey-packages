$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.47.5.exe'
  softwareName   = 'Cacher*'
  checksum       = 'fea0294213b35fcca06a9af56ec5204765311d31b6b950b7d23ded9530056dc69abd424fdded316e65857ef60d2a33ec85dafbcaf1004e465f1ad4813daa0d6b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
