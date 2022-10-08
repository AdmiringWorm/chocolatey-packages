$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '2dbe4750c889a00f7f5a6d5edb3a9c4a156293687b30c210f6815113b65ded442e24ba097364f8861477d199fe95585280b75a6900ff6f80179acbfb105ec3b4'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
