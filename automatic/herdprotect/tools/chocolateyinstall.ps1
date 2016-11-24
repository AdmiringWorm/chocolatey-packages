$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'herdprotect'
  fileType      = 'exe'
  url           = 'https://www.herdprotect.com/installers/herdProtectScan_Setup.exe'

  softwareName  = 'herdProtect*'

  checksum      = '413B6FEB2E88CB94E7021D60B15787021B2ED72E7E908E4159A3744A6CAF7F0E'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
