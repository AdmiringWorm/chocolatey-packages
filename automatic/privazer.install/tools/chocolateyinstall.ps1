$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '2a75b1e93f4786607651a0257fad22a253ce95faaa4a2e1ab59e6329621242ade093e8937ddf44acc7c55cce18acd0e5d44afc7b816e4134d5ef13630f120271'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
