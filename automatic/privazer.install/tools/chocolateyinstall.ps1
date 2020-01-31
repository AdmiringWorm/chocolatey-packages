$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '9f9c9870751b37240ebc075770796190e81b0cdb17054b027b03369f5a3b0296bb73b9c806a583589d043fa4d8cac4fd11848ac17775691ecd172f297a04fd8b'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
