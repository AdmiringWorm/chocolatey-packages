$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '79ff2f5b42b51ee536ba5da33fe22be56f4fe7d8d26a12018c7110d8b6e04afe22cd5ace8bbc834528fd096fd8c8a3e4521a755c9a84ed0b23c3e1747ca5a385'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
