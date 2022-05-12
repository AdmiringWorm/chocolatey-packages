$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.1.2/ioninja-5.1.2-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.1.2/ioninja-5.1.2-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '8db59263dd406779dfa749ef9eb16fe9e0e93436952fc265bbe7a7bc61a81cd3c924ae400a18c43d6fa560bd963fa5ac157974f5a9dbedf650a2d459325efff6'
  checksumType   = 'sha512'
  checksum64     = 'c8d5a5bde767f3cdb5c8647afb90272edbdbcbfe85bbaebb10c9d67187cc2e87068fe277c2e232a8a68aa755849cf5826187dbf472127bbfc528158f84c431d1'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
