$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.12.1/ioninja-3.12.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.12.1/ioninja-3.12.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'f838f582f471c6ad2e2adbfff4f6137ead8aa561518f3e3f90fab0ad8771ba7947c321cc319a2d880c9662f93e7a1766853cd8833fee000428bf02f64f37ecf4'
  checksumType   = 'sha512'
  checksum64     = '60a8851ad4775989a961761bcc8b63acac535c55d1a4a5f2e7fcf82d0f8179e01dbce1df84eb278c7c167fcb73e5f577db8f988b7c4c3ab712319a14c6d7defc'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
