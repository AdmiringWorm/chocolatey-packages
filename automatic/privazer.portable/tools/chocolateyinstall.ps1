$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '024864d7beefd85ee6caa032caee2a1517134b3ffc3e3b707db92c73626bcfb7a1dae8019ed5ed0d972fdada351b6c094ac616ad42c8f6e5bde62ad3ae9d760e'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
