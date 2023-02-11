$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd01a993050f91544b75d8d17924fe697f9fe713693830030019b8cc083e5f092079ae37e6ea9ff4d03fc5c79f0f6e079f63f80e4c33e36a01a960346ce0bdbec'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
