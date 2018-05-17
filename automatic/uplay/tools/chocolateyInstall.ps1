$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '7D44143B2888F49B860AB0F9DDC7ED50F0665612187C9F76CB478414E59EBD436BC76C1B7C51A7000548C3566ECFA6D3ADD000938E3BBF8DD53580FFDD13ACBD'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
