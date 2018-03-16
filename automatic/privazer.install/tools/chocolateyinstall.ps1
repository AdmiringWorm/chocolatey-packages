$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '7895f6e65e422a3884c8f0ac45611bf92bba1c28694ac91297ebec70089144b8f2725bcafbaf422e6894609266eee8730b811494696f39cdff6c60b1e07eda47'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
