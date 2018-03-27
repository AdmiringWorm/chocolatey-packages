$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.10.exe'
  softwareName   = 'Cacher*'
  checksum       = '7ba5b49635487f776805ced1fbeb74e564dae8b533294f5f2af06683073a85dada4d74f1a1e9309b51475359ddb91a0226e4553fe102ebdb4a96ef63af45c220'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
