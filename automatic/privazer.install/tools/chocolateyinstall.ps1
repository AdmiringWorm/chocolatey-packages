$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '00be08e5a7b0e38976398e7382ae825b402f4301eb4cb21b7d8a5ef40873a6a0fd03a4513e316c31860925e56db2b1e2ec695d531e11bbf6ae2c30866d7f7c39'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
