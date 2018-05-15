$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '6d8c43edde5bba38fb162ac3f81f35bbeb21c5f45e92d07755c1536b5c5afb2d906e28f20d2b342b4ff63df0843e008f3406a673def084223e20ee09210b5ba7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
