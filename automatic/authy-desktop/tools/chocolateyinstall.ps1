$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  url64bit       = 'https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/1.8.0/win32/x64/Authy%20Desktop%20Setup%201.8.0.exe'
  softwareName   = 'Authy Desktop*'
  checksum       = ''
  checksumType   = ''
  checksum64     = 'fba1d4ceb2cb459494a96b3f2b3ff78f5f2fca8045e82a1be002278beda0852a0d3cc93f3a8f386e0f904b5b80a557ee08d246a1ad9a871b6f5ed36394c9a4b2'
  checksumType64 = 'sha512'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
