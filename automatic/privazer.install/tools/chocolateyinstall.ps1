$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '82863f766f6f619e210f34605c316193b0c197c323c517fe0bff10822855a4652a472dedde614509db5014f25c886ac205b4654c872d16b735e79697db9789b6'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
