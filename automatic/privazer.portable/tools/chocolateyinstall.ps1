$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/privazer.exe'
  checksum       = '8e824fcbf0c0bc02c1ab8c441e9756c51a9bc715def66be089c79018cdd49cc4ea70bf2a8c9162e649041799334a8758af2378441510b41f48f2f3b31c02060b'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
