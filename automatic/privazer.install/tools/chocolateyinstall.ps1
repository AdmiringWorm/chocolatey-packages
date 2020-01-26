$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '936e77239133859b6046b078fcdd0d09577515f4458919fd27f5fa6597f57b84bfdd612282db6ed36b5628228bbca29809fbe577efa02a00ddf01932aa046528'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
