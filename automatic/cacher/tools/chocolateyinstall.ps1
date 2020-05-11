$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.27.2.exe'
  softwareName   = 'Cacher*'
  checksum       = '20e9fecaed33fb797ebbbe190a60c57410be2b57c1a321cb6315551a1a9ed78a3c8e36bb71ad0be760bb3923a9e2be388906486006afcd47becff374540ec195'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
