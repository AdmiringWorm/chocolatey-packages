$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.1.0/ioninja-5.1.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.1.0/ioninja-5.1.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '78abd4a2e74e5d3bcce191f91a63251274b6baa95d374a8b2ddd9c8dc4d293df89a477c2f30fecd8681e5db39e8c362d3f2c4992996d2073d115e550ab33a919'
  checksumType   = 'sha512'
  checksum64     = '5d5630da1518752fb9bb8c87cf279df70b2e6542f65b6f2e856023860edb8bf8658f9376ec8641739db4c9d2217da9b556607f1ae681b5de08e58a8028368bc8'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
