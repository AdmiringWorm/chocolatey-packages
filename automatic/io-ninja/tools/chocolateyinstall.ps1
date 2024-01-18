$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.5.0/ioninja-5.5.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.5.0/ioninja-5.5.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '4bb3af34d87b8be733c612ddde7c9faeebca6c61f6486ce1da1cae443b09ab5c317da2e47c4f8d656185a4a87bc67526a91f0538e08d16dcaa8629f87db9858f'
  checksumType   = 'sha512'
  checksum64     = '890168811051e4095add184539e78e2fb2cf8c2e325fdc723c0efaced33d54260f5f0b50957a68e0ba922518ff8e327352e63ef6a6afaf6b9153f1fbb3f112f7'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
