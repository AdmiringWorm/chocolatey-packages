$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '87c5aa7cc36ec8ad9aac24fceddba6cd5faa01553f39d23e75e563a5dc50ceca017a8cafa33e5853ec8278a5a19081f6884f08116e622870f8de7ca15885e657'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
