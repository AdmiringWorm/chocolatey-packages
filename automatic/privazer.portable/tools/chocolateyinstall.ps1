$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = 'ab09f11d4ac1312174182f6393ad637c3b257b5db0fe91fe00dfc706fd29cebf4cd3af65debff323866ee67728796f2653d31600b04029f4e42f8082b9f12a81'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
