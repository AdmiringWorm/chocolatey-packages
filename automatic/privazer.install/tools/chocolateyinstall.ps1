$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'c00356c51fa48b633bf37227e24c910afb8a7ba1f4699422476dba5d903e54d02f2bbafad18c7685aacd7995a41b405312ee2a0f3a9ee61edf0e75ffdeeb6001'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
