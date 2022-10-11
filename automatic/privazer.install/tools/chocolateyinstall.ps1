$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'de04306eb5a0681ef08779e4c5edf1aa668b2b6f7be2f5010b5d22a75c72bd22b11c8337748f80798bb0d60b6179f4533e551262082f19d9ad47dc2b1940f269'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
