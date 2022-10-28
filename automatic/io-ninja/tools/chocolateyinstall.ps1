$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.2.1/ioninja-5.2.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.2.1/ioninja-5.2.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '09ff383f9f06bac7a6f8a00d3679474da7c199382c34996a68571c504339c52e1364c1eac7afbe5fcf09c714d994e1e806a5b7eeeeec6d81253f9481483cec07'
  checksumType   = 'sha512'
  checksum64     = '735b1f08058102be672a54bfb74ee83d8b17dd2d59215a00b5a38812467bed7033122c9203ff46e86c27b884c537f236106335f5259a19ea2b6419777cb6b06d'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
