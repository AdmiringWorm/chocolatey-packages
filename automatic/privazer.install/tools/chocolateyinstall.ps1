$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '11b38c3f37c9213d8b26cc8473146b862082afe0a54b8e66e5425186f111a3a72eb0ef8516bcdaf91b7306bfe27ffee9c78f2ca1524bc896b88fbb99d0176bb9'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
