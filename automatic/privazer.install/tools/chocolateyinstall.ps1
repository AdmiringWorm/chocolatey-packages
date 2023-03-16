$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '32e40fa953455d7271bddc32cbc82c595abe18bb1cca9fcca965ea3fb8ed0716b88eaf88acf4e13c8149836b8ef9f311b8c2e047ef725c932c285e2fba86422d'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
