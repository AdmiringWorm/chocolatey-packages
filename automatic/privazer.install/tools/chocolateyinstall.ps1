$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '2e3c1350968b4d9cba471d6fbddb26f1f46f4c9a448265401f02acb017f3f882338c11944069fad50f887fc5870d86c79957046b2cf64256c41506de7531008e'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
