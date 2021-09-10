$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.0.1/ioninja-5.0.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.0.1/ioninja-5.0.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'c3a6eeb50461b18d1e39a428c51e03a798974e38672a00b512305c92cd195429f4d9000ed7d778abf1568d14c87071a3e36436c497a343d6f7e7eb73f26db40e'
  checksumType   = 'sha512'
  checksum64     = 'deb176e518a61e3937544741b0185ea6aeb5fe165b626ff9e9d912b908964643bea56cb37d576cf31c447d5c099f81e1a022e54a1042978063ce598591a894b0'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
