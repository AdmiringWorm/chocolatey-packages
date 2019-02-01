$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.2/ioninja-3.10.2-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.2/ioninja-3.10.2-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'd76acbe961916346b804d78a181921b249fd1f06185da159890310c8bd4023c4ed129584e76c1d89ac21062ad27343126d7eb4b97efe598cd07d943c41741f22'
  checksumType   = 'sha512'
  checksum64     = '0dcf5b04df321063bfd137dd8b1fcb07b0fb2049abf2633736ca5a159bc1d5e7d7d4dbb93c1eac95c4cdb23e8fb51a0f89a78dcb306d4aa1026d225a5a74a57c'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
