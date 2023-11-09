$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.4.2/ioninja-5.4.2-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.4.2/ioninja-5.4.2-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '5ea98f9f3b2544c1c1f2fea7ab5a3df611c63da08e65df40c50e4bcb967f8c85110df8181ef80d5fe82256531b19ddec35815a9cc5fbd064d83792dc4116b50b'
  checksumType   = 'sha512'
  checksum64     = 'e4a1c52095c81667878636f33dd336304c171bfa55c0aeb336f6c7e344fa07ff69c02d91ea45afacaae1caf8a53300d72a5f8a425cc050f882c51ae722a6dc47'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
