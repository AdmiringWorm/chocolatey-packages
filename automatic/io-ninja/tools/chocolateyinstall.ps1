$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.7.1/ioninja-5.7.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.7.1/ioninja-5.7.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '8db00742d4474af46bb09d3a42c882c3a94f428a177088e9b2c5a3f5f606df893c37b9379f220d33b3a99353fb3b189905fdbcfb402fb1f15c306350a7e47b83'
  checksumType   = 'sha512'
  checksum64     = '8495d5679c7af74c66d9b0d60efb9fc54d1abd8bf98bdb232ecd69f0d559ae1dfa4543f9d3fd009fc5094d3d7412f086be4415029f1799f627c123f4ea88f46d'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
