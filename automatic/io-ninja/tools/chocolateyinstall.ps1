$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.3.1/ioninja-5.3.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.3.1/ioninja-5.3.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '38b19727742ae3bf36656d468faa9019b2f94b54de8fe85f0b8cbaa1cdedbd8a269aab6ce99d9d1fe7681c102c959de32514328cd3e9a6a27d0e29035674036d'
  checksumType   = 'sha512'
  checksum64     = 'a75c04b028f18f9d96e6b1239557317ed7794318c1336cb864edbd46dbce6c08d798f386caeed4d5d35924e3241a4548ee8e7b3dc984beffe32109d30c28ff80'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
