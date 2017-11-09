$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = 'c5be143f786055a1bec095f53d36a70e4b07a11d9e9af8b70fbf7195524f58adaba1c8af3770447284bbba12ac9ff8ea9fe150fc115d053e606178a06a2f8ffa'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
