$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://privazer.com/PrivaZer.exe'
  checksum       = '79c2a45f329754ddc49af0e0cfe60ae1c1b1331e9306df7a288dba3e8c75909b62a465d4c7bb1f93080edc6f6f60fbd5aa3e8a7d1b1adffaa9ca6a65b576dd88'
  checksumType   = 'sha512'
  fileFullPath   = "$toolsDir\privazer.exe"
}

Get-ChocolateyWebFile @packageArgs

Set-Content -Path "$($packageArgs.fileFullPath).gui" -Value ""
