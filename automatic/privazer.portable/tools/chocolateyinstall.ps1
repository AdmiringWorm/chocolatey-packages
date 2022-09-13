$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '11dfb4736fa2ac955bd72bed6c0d653d24021af5bf8fb4ff00c3172e3fd60c822a19aecdc442a42fd5c78c61a57602b12cb5a74f1fa91aa2aa53a2a440d5fd20'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
