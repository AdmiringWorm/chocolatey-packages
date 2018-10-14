$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '487b1a2efc8037d26d08f01244d9acb8a8d01868dbd9c5f129937a0ade2fc6488ea9a07b595f0084f25c08c544bff5fdaa4b44694a33388208781cc8c498a7ec'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
