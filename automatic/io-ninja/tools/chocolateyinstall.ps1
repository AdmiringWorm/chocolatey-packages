$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://ioninja.com/downloads/archive/ioninja/ioninja-5.9.0/ioninja-5.9.0-windows-x86.msi'
  url64bit       = 'https://ioninja.com/downloads/archive/ioninja/ioninja-5.9.0/ioninja-5.9.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'c30489ce724bb6b556453765d8a00abbf5ea2c0fea0cdd0c103da19417485a2d059b7e993c6c13a57490d5ee5d4755b3cd2b6034035b5aafae886a5d7f31e4f4'
  checksumType   = 'sha512'
  checksum64     = '58838299ec67736881a718c83d38074f1e32bc6b154176cd08e5feb3d03276453b89ae9ec9159c6ff4649fe30e0ec5cbf93acd4024f1f472bf15ea09aa01afb0'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
