$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.13.4.exe'
  softwareName   = 'Cacher*'
  checksum       = 'd7ce8ef801ad86c486dbab434199aeb7cd4198bfeaf48b69f7fd9d64ec0ca065df1f176fe22f0beb664392f914615498eb1713616dabfde2ee7ad8643247cf98'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
