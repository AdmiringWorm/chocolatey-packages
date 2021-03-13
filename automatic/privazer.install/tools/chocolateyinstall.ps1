$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '25823651c66e592fbabf89929b794c0b2a7adff31e10e0a9e0c777430ff619cf8d76455d318f6cfbc45a614c71c527b176e02a1468876bb6a082d137e9dd4a4d'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
