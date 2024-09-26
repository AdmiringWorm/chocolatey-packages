$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.7.0/ioninja-5.7.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.7.0/ioninja-5.7.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '5314ab53f1f966311a76d414e875b05e425db905b3e624739ed1b8197200e3ecac85d2fc389c7c3e179af44ec803e4551eb5a8e35026fd161ffea0a7cc94b344'
  checksumType   = 'sha512'
  checksum64     = '76b620b2c99df783034846a40e5e954b8e1fe4eea61188664cbaa09956b8e06d9f926db623ee68c5f9df77cc7646bff641e72f9204a920a82994700cba17ebc1'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
