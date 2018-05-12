$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '83e691cde99c82afab47e142205bc1604cbdb78fe2c91a7419f1666c649816758d96a1626eb9cda18e766202103c41acbfc1cdac57081a3e8efe6c1b3235ec65'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
