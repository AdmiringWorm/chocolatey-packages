$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '3aa0c376e6c66ad4a24eaa71da23f401522b01c445c293ee775dc6d31b5df970b794bdc411020d968786120cbfea588a07db581fca9467e21d2fe86cd7c01cf1'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
