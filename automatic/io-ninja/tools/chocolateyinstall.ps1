$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.5/ioninja-3.10.5-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.10.5/ioninja-3.10.5-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'be24548334bb1e310184d450783aa3c62bd55739aaf1a23d8d3f69693e0139c1bdcadfade6af9774340e5067bbb1e8a1fce7accf77c14eac5893e99d37fd449d'
  checksumType   = 'sha512'
  checksum64     = '02a5823279e112e4b26f49b3e659c90e3d0e46d250b935a82204a92a4efd166f76c370fdd5478e04957099307b9b8f9b5065d8d750ef402ba5f9708c939f8749'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
