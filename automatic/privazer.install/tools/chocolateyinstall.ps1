$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1a680fcd5484a2b047d3dc406971c7cfdeddd3cdd97628b299df2a7eacb65ab2cddc98c38c078de638e43524cdb7966e55ce74e38903375e0896337fefccb40c'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
