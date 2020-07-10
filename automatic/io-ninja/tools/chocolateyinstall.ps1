$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.3/ioninja-3.14.3-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.14.3/ioninja-3.14.3-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'ec6678bde71d0516fd07055112284fdbed4ddc5d2d83520833da3905e50bcb1ff227826e4a214671b02e8c92c08cb6d792274915df6292b2bca1d989fef8c01e'
  checksumType   = 'sha512'
  checksum64     = '01cace2339ab7890d01dca976f2ecdfe7e5b6f472b89ae329a33dfad5a588c932c989c9921a7b50dcea065e9602da6c1917ca23b6b0ee7237cb73558296a5eab'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
