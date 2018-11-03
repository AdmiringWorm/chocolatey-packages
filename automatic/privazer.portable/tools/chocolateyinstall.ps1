$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '1f9f3f1d091d5cd248ee411d26968e65d9b84e388b6acb18909c75f0d035c9ee0b611ba3270e6b864a16cd04680a16d4b44cf0e3e45eedbf1a2a6f3cf05e8d16'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
