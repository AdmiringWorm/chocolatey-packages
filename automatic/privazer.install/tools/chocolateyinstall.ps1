$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '17815240759863301b69f4853065740ff1f066c5f8d2093bcd2fc05e75656b1fcf88cf17a0291741d332f9d52bc3d7e24ef21f5619c4cd88268f63a44cc38253'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
