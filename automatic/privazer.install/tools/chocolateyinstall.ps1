$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '137d0eda3a33cf4dbfe7b1cbe25c5c3451c4d472fbc4df6dba25dfedb4d004811281f8772946cb06b9d45b60dcf86b85e8a21d084063aa5b5706b4bea82affb6'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
