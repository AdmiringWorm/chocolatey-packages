$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '228a174b92d9e2bd0f9482daad1c418a746d94a464c2f365938e3c269e30ea214d1a38cc4a15d65907bcbcef103f629f6ef38ed434128d787e8a6e4e4dffede9'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
