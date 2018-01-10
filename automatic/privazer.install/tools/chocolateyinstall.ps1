$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'f48c3970899ae2279991efb109557e8e3105f90fc35513b3e35f7288f66896539dfcb054c466afbbd7f5b8e8e94cda3488b47ac43ecec3865d642ab1be87fca3'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
