$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.7.2/ioninja-5.7.2-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.7.2/ioninja-5.7.2-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'df4c9cc51275117900dd1f46f808543613e5ddcc3d2ae66c22b934ff50d83364a7a5fdd6bebee4dd6eee7b122fdf4118d855bf5bbf49b68c71d64bdbc4cc1986'
  checksumType   = 'sha512'
  checksum64     = 'c02a122f771abf6ee7464620647e0136bfc5f80bc1873b6f334bba48d0cf602eb9e8f4579f10bb17fcbed8782e8165768e09aebf1637e8d443daf6dd8763d47e'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
