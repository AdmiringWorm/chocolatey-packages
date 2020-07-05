$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd69253c1884353ed671e03d12acd49abd8140c265d741bde70fdf5436d564b7a79e80d6e901d44c39a9d595a57fbcc63be3f2c0f4a8faa1ea84233fd6a5de59a'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
