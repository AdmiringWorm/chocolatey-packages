$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.6.11.exe'
  softwareName   = 'Cacher*'
  checksum       = '2bf8a3b87ac0bf57155663785f3ff218233a765de48a9c20c9a00d4112bf23cc7371ebbe6cbadee6abd9394815d98f7602498aa325e3c5bdee534bd2b024c845'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
