$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.4/ioninja-windows-3.7.4-x86.msi'
  url64bit       = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.4/ioninja-windows-3.7.4-amd64.msi'
  softwareName   = 'io-ninja*'
  checksum       = 'be1231ce67a08e91401ce73f57d49f261b20b5ad4cbb8149bedd0181256ad7cc'
  checksumType   = ''
  checksum64     = '1ab0b2f916f438d6a923636fbc83793f1f0495341ceb7bc91dc3e7697fb61ef9'
  checksumType64 = ''
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
