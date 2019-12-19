$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.7.2/win32/x64/Authy%20Desktop%20Setup%201.7.2.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = 'ef2792cfc3de6a8ae6b36e48314f50fc65222b3b9b55bd7ff0d1ffb0af92d91ec5636f84564fb772f86d55bcc5bea71d19efb5d084192b8c3ca83fd9f90c9e4d'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
