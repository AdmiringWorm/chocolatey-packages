$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '3645bc5f2a46e60a6131e5748e0d967926a0e73bb457a3cd2ec834e2fcf58d33aa931c3c00c0b30332046611e92afaa756e21e01f83317fc25972d3c860cf247'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
