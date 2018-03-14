$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.5.exe'
  softwareName   = 'Cacher*'
  checksum       = '47fa610c607f6882f19d06dc304ad083b49fc558a8c871fb498cc2e4f339ad4f4bf6a043dd7745d3d10a3a32bbe59662844cc9cc19e6b19e36ff1fbba07df688'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
