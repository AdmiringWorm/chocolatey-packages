$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.12.2/ioninja-3.12.2-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.12.2/ioninja-3.12.2-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '9c3b0a258ae3d0c9679a34eb0fee381d9b14601a7937b031bd0513e2d0941b5dc86b2c26aaa7f5c34e7a5315d831b841e56e533a0106946f1d7bf5ba788e99b5'
  checksumType   = 'sha512'
  checksum64     = '68f3bdf72ff2f5b657a74115d0b7cf8895535614792fa2ee000e2c8b3d00889acfda6a139b4b37170212a384fd8c51137df7f821bec8d8ba58cdacd52ced534b'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
