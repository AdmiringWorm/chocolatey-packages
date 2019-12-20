$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.12.0/ioninja-3.12.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.12.0/ioninja-3.12.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '8b32237c646898324487fa0e29358974f9f226f0a6db1abe8e44785cf978b2fee7c855ff6e0cb1566a08c70dc662a2f8ec00b9747d90558c86d03e8e3bdb8684'
  checksumType   = 'sha512'
  checksum64     = '4b4403893c268874252a20dc99759922f04e3a24057cdb2739918f1cacb9d7e058b52b3e25b6488a1a1c628285175facd35a446f0bd13cd12d782f77ac3c0034'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
