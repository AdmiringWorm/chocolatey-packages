$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '5112fbefcdc9f87a3cc2abac9f1c9f651f61fb9bfeb38bebbf1456cf45a7f67606fecf34005016398f933519947f1df437832c0ded3ef60cb44ae449c7286f4e'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
