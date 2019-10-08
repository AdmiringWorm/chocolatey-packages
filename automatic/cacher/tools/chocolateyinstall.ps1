$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.20.2.exe'
  softwareName   = 'Cacher*'
  checksum       = 'cc57db0347adde0569e12cfc0d02567913c24b9cd08d3e2502c1cd650bb62f5c44b4f06461d64f62f32096d2fa5e62ab3d60b3ac0abd146e7718c12c677e9a4a'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
