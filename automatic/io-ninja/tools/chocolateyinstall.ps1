$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.1/ioninja-3.10.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.1/ioninja-3.10.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '62594fa0254537d51e8bf00a664cc517417e353a36ae919e45d857e6398b460f92ab2eb4bfbc49bd13957943dfaf1ba35a61df6d3b6cd5af77a324b2e7c5d3e7'
  checksumType   = 'sha512'
  checksum64     = '86f7b96f673b702d51e8509a8b9a21c97a53b5647e7eed1925e2acaf2991d8b087f18520b03af630d2bd26d99f5a740578a2ed11562d18a99e9e43875097a8d1'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
