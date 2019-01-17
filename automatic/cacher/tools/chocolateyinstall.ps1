$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.4.1.exe'
  softwareName   = 'Cacher*'
  checksum       = 'b4017b82c0f64bb5ad2f961671d8c2d642f3a3040c065ccc36a0e97e00d71573eb4396b558b57568aa9f2e8ea182b199399450bab4838f87ab4de34eb1a1ade2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
