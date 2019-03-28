$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.3/ioninja-3.10.3-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.3/ioninja-3.10.3-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'c5b6d33e3ebbefdcb4a9a0042a4baad6edf8aa5e2829611957ffe798ea5e839c139cd1c7a1fac4a4fc72a89fd3ea343cf98140f6afcf661b8d160cd64e481244'
  checksumType   = 'sha512'
  checksum64     = '993ac9296ddb7662c1c5afdfa220194bb447a94f27eb6bb40ebe7bc49fd195426d088a7fe9c74eb6253161c5f49cc34546ba958195f0319852b4c3e2cdd440af'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
