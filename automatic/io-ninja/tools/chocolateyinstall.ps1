$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.2.0/ioninja-5.2.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.2.0/ioninja-5.2.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '4019872637db7f50329db3cc817b9aa8865d92b7951cc6ca5cf81d1888e4be07abf97ff8fd5ff42ba78336d5d044feaaf00cec94b820f134f03b13b63035ba8f'
  checksumType   = 'sha512'
  checksum64     = '988bedb6433557859eebf02aaec65a2863dc4c7fc2e738127f31a66285a62da8d18689b4680262c83a9e598530fcc636be5675eb814393744fd08e5f5255ab6e'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
