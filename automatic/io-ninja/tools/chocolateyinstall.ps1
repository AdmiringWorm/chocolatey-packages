$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.15.1/ioninja-3.15.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.15.1/ioninja-3.15.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'a39989e4e86200e0b1c94b8622c002ef705a384a5f8bfedc5835217b7f17cc2bb6e791a2a0648a821d3fc29d80b55053fd559a2d7639fbfd80a07142bd92456c'
  checksumType   = 'sha512'
  checksum64     = '76aa15dc884f44858bfc1521caf951cd523555663647b123851520daf2e2fc662a73f8e7f7a6b23eb34a979810ab650df5f0ce00ba6764c4365a99ae5fa06518'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
