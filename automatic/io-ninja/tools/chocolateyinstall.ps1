$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.5.1/ioninja-5.5.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.5.1/ioninja-5.5.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '853f919ed4cf232827c41afa63b860dd70eaf9d1d5fafb316bd8234f8633eb9033bb5a95f3ccc0606e26e6556ef2f8063605928666347dae6a16bd00e7e5aa98'
  checksumType   = 'sha512'
  checksum64     = 'c6d3a9887486b28b66de656abbedf04c970d5d69855e2ed7cae1d4ca20a8f7da8f1ef3e9f3e1b5df41f1a4f8bc1e18cdfc7f756865228f62a3199e663d088cdc'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
