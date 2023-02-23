$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.3.0/ioninja-5.3.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.3.0/ioninja-5.3.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'eec002e15576954f27a8cf94a7953bfd89e4ea20b5f335a1546268492ea5130286f9fe644879e22ed161619c5990f236c7ae30b8ee79ad73b441651bc96d6f66'
  checksumType   = 'sha512'
  checksum64     = '43a2170e8e3d03052b8f95f62c3a2296c3e2359db2a9b527ef48bebed8a4440bfb97e5c14165ec504e66c674ef2a89720ee8ae8dca2ffc5256243aeb58f89124'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
