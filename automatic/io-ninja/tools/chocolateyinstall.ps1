$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.4/ioninja-3.14.4-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.4/ioninja-3.14.4-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'a96a6855ea93271b3b6ccb70f56b36f8247b20070a04f61b37aeff360ac3535a54b5b983ce3fb56047de2b99b5728a8c654a13ab28c0b46c257b6c68328a6ce9'
  checksumType   = 'sha512'
  checksum64     = '74e7ec8064c2f92dbb8f96e1292c475ed658d238881641f07f61b1faaaef9aea0e717ecd0dbfccc862a428e5f55fa2a3f2f64ecc2481e02c8445431e5997b556'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
