$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.11.0/ioninja-3.11.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.11.0/ioninja-3.11.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '050e72328f559ebaeaaebfe0a036d8dd1b326c74c3aef7faa5653d24335445c43a0d0ea72130be9d6b7fac12302a8430eb8981f9c4ec7149ea108bbf1716ed07'
  checksumType   = 'sha512'
  checksum64     = 'dc7da5e45c96301f0cc29869a8dc03978f422a8e552de886e4d37361571053606ce16dd52c4df8141569a72b11e4b6f6162026040ac0dbde93b46864e00beba9'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
