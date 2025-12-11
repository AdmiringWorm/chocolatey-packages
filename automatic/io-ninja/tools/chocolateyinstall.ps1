$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://ioninja.com/downloads/archive/ioninja/ioninja-5.9.1/ioninja-5.9.1-windows-x86.msi'
  url64bit       = 'https://ioninja.com/downloads/archive/ioninja/ioninja-5.9.1/ioninja-5.9.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '693b7e2ba147320912c1d3603ad2cc7229c833524c4e98ebe6ecbd7d2698434d7732e02fbeb55e20ffc9e7b08a7338844b69d8348bef8112aa5df30f011673e9'
  checksumType   = 'sha512'
  checksum64     = '5afddfd6e015cf49de4318bac889f118fd94ea13af72f1769c5233c058da935f8c69dc5dd98cc2f1d856fb091d707a6153547d5e5a6d5176ca1056f929cfc084'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
