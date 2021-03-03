$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'fb7790c8693be28d61ccae7f40f21cad231ea42994f8bc1073ade4de70d1b2c97519c4f4fefc9db4ec8d238ca7f3b8c667dc0c99a979d0d226794e999b85c375'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
