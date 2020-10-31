$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '3d7c29757bcd810844c757d93f9f6b69e955d3d33fd77a431a0b5a5e24df7a5746915cb0aecf7c75702641b4b3f41ab29ebd0c1ccb8f3ae2151e57dc767b0d42'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
