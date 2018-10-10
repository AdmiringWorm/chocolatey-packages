$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.10.exe'
  softwareName   = 'Cacher*'
  checksum       = '84b63f719248c3bd66c2171fa29a446a2a74ea3114fb9dd12b383579bbda367f3d57515d4500d260b478796f325d8cfca30851d2a373d9458f659babcb1f2631'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
