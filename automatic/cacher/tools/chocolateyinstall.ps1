$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.4.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '64796c7cb0122cf0f772dc80ff31a452bd5ab47f1f17b16f622d9fb16a1b4d45aa9ccb6aa513277fd00aa086e00a97984a2ff3668ea120cbdf62576c46ae9808'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
