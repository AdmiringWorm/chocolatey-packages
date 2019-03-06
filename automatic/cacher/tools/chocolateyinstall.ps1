$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '916b7eaed8437b8716f19a93f5f06591a52105a75092b088e2fd4bf6067440a66e34f078ea159758370faac7622ecdaa6fd925e202e246415141b36d9ed116b0'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
