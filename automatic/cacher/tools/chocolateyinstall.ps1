$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.33.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '01a9aa58e81fa908807619baa8ba32e48cb5b45bc424abfb7f279f10034cf3ac758e289ecf65e2966fc0b08883e5fd9ad87386a4ed4b75b27e7f6c621b0dd7b5'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
