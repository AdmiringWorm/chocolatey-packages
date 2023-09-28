$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.4.0/ioninja-5.4.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.4.0/ioninja-5.4.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '9460dc64fd6a85598249b50bfc2bc33a7391f1d88ebcba18c5e04994e6d9fa34d96613c51ef55d73a69025e6a6c5567362d0889b4c179e5830bb183e70516790'
  checksumType   = 'sha512'
  checksum64     = 'd3168cfeba27315d9deab61ff21aa94f0a441f6c3ebe7e7f0eb79bc6ba557b32d9dbf04a9b4a56b567e0e7b972e8b5198ae697d671fc558451e497191d0d9ac6'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
