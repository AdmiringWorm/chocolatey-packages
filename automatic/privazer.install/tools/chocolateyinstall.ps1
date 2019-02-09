$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '7511383546897f65dcba8a8c81a007101f09879201bef6c6303a56c467fd15e864098b574c9e45b7aa6f9adc6f1b960f4fc91610ee2d95e4c39c6a4138c57b38'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
