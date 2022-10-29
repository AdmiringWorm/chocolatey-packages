$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd5b4c4193d3fedb8af6d0b61d7ec111f91760bc1a7cbfb20c88ddabd1dde89fc4eb2725e7b9b0354c749fc261b27a7f78e845dc46a53d6707b5a03e62bbbb41d'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
