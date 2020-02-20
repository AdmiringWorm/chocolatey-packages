$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'e2da2dbfb071bdc845a1e42615114ab9a68a9b4d954129b395b87d688ba5431b957846c17b7cee01af2605e7920e14f973f3a9ee250128341e750797fcf715a5'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
