$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '1dc54ce3408330297cc3e1e2b983285fe280ecfc9b60c806d67b64fbc41535cb6e33c5a165801abaf1ac3305476ba555655c29373f8f1fc576bcd87b45a0ff75'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
