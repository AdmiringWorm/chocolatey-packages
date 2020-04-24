$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.2/ioninja-3.14.2-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.2/ioninja-3.14.2-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '357ddaba3681ebe5b7ecc176cb2dbaeb50eb978939ce998e9751083496d2e1e3dab8a1b5fafa5cc6a6cdd6f77b0aa6d8364eb43823872018b44acc4cc6a72899'
  checksumType   = 'sha512'
  checksum64     = 'c045b4e445465b4851f3b5cec1e4b744e034a27e9a5587a5ab92f300fa0ecd02920576f6b3aa70e96bea968195b4f7393666bcbf32546e2fe6a1667ec8f9b408'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
