$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'da4444c90e8dbd51bb810e23a8b1aa591fbc1514f6332e388fb9829d5d99723b8f0ff43bffc07f6bc173e449c7c872e507578da432b40dc25b259b3b5cb2a72b'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
