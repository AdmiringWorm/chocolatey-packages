$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.6.0/ioninja-5.6.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.6.0/ioninja-5.6.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'fb1c860d46e844c3c26633e797913865cc9fd1fbdff6b989316942b108cc36984232889506335e605ca53393bc8b8829808b16b4fc9e2b2532db1363bab7e342'
  checksumType   = 'sha512'
  checksum64     = '3297d82f2d5b95228040b29c7ad005f177ec884870a8a9e784ae2776eafbacc895c4c8ea9eeedc66f2c4997ab880c9f79a5a231f63d689428be3e413f7b0c8b7'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
