$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.13.3.exe'
  softwareName   = 'Cacher*'
  checksum       = 'b165211a8c7511ce6cde017b43d2b43b9f472f5823eb046a20c23e6080e6ada1932ddbe4769a63f9df45ca96d9da475c6907700f265a2f7b4ceb9464debbab4b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
