$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '175eb6d02fee7af392c7fc8f9341aa5ed2b73372702d7364c9aa7a9f3149ae987b87c4235705f926abae024f63c6e1dc1b6cc332ad8cd5e16de6020388cb2a46'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
