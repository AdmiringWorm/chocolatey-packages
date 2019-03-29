$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.4/ioninja-3.10.4-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.4/ioninja-3.10.4-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'c6e32908c2366714bac7f4bd9bbd18e7674040e3fd6b6b8554241e8541dd837dbda4ac6798a0f9083fcd2df2fe28005baf8c5cb42b78a8a7d44f70b82a48fbf8'
  checksumType   = 'sha512'
  checksum64     = '4a22ee6d51b33f29bb7d24a4e80e178d6f5c6c518ab81cb9e6efefee4aabcabdbff9bf067f88d91dcb8667d739e126cfc2e624f931b34f7ffcb0c16c5c507f73'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
