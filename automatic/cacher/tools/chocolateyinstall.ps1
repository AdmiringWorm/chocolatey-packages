$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.18.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '4a8e218010db1d5ae4ec61239bc1ad21498cdbc3a4ccf161d02573d430901b5cf5891a4e945fe59a90ae78ebc443f6ebf32a6ff4223304a71755cd002f5b1932'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
