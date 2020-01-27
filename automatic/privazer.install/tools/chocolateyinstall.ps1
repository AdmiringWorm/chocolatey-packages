$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'c7f8bb9515b2340cf7ec3207c779e142984ad9d7a70f08b7f21eb65b4bd87bd7dae63b1d4942a4be83a2cc11666bbbcb44286078429feb019956bbf91e5cb5dc'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
