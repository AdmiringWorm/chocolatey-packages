$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'c572dbfbdf408b172fcf5a9f0e69dcb66715ddcc2df99ebb0dcde8c8dd22956a5e5ba24a816fb142be61de27fc8b3795df9e60e4c14580d5ed60bea4b45e473b'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
