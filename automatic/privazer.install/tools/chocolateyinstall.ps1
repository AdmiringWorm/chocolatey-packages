$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'b0f1b4a5de4dc8378a47f06a7458964724af36b0dcfb337e24f50854bd5e972d60f14269b024230e3ead4767794dbae2aa43f453590b7f088bf7f71b9c647f1e'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
