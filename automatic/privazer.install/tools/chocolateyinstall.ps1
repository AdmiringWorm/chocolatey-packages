$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'a5923f7e06f61a0d83b8941bdef15a7b010fe4717a9ff292df82f8ce95351a5b20d8a2d8dc20fc8fc3a5cb7d8a6645587aef618c375bb8e3f69d6aae48660d7f'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
