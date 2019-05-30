$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'e2fe6c662acd4b9ba5b824dc72ae4682a2a58b64c2dc7266dbd54bf0b9c17f0b7240a0acf886cc04e316a06db358dcd0b8baf091e71a986f66f58b487eaa3a37'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
