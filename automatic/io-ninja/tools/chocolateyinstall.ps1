$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.1.1/ioninja-5.1.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.1.1/ioninja-5.1.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'a3e1fd1adfb8d57943d15ab01f4714f9c5338a79248467fb098bd91603bcf8e9aa98f6c5161ec3e9cb0c1a55fca2e7e6d8cb5642276c4fc49200902481aec4e2'
  checksumType   = 'sha512'
  checksum64     = '311e2f6a05570a6eabf9288c58490a36385103693eee9aa96dfbb7eca1cf0c4453ea81a1826778aa9289eeb799574f33e74a6fa21972e01e5ad76104ae4554e2'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
