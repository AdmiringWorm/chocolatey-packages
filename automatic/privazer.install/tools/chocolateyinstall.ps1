$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'b863fbc99ba3ffcaa93f4b3542d214b0a685402aaf12d3c70a424e5c835afdabf8ce856440f4f8a294eff8071dbd66c584848b75faa1c2fbd1fd39c8ec61da3a'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
