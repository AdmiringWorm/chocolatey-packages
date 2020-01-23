$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'ae9f2eca60bd85ad1d94d22cb8e5e973f943faee5772851f03691a3a022f7e8c2387383c0459547690f89b709d51ef3a6a2f6b21ff1aa0752688c6e911ce851d'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
