$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = 'b0166b1aa29998daf22b0056a947b5d2e40b0f31ed2eedde5f8f8727c2508139ee9beb3018ca61afa9dc80ca2bd03d22ce4a0dc48dd9bdab6aeb79cfc626cc35'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
