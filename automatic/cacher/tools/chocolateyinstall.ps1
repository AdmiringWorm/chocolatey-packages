$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.27.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '0094ad092c68e2c4478b1b5e330bc6782d5e78152d330c6415b5a7d058a3b24dc23357c9cb30daea93b1717901edc465375ba8c97d35bf4adfd76da60cf0b688'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
