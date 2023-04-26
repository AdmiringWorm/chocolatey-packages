$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.3.2/ioninja-5.3.2-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.3.2/ioninja-5.3.2-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'd157ad6a20a8c35771284d17ab984474260127f3bb0cd84db4fa8cb2c1e5897486615fdcfbe9d51f613a08c54c13b3b1cea91171132e9fcd05b0df45741dac6d'
  checksumType   = 'sha512'
  checksum64     = '3fbb4d9424f170343607290362db53d89c5f50a38937419c0e2bd42c0805b6dfdfdb29859bc1f9179c8010c4ec53eca6b829dc97358001f9df1c774fe8553bfb'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
