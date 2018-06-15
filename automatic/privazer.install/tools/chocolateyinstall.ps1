$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '9c4c9c6728b2390495a263b52765ad3f2e99ca1f2d9f4ceb3a4432b52bca240f57450c12940704d7591e9cc92450b6a35afd8f0d73c0ac5f2cc1bda44782fac0'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
