$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.11.1/ioninja-3.11.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.11.1/ioninja-3.11.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '89a52f1903b7deea41ffc9387b9357d08b1d2a9a79db094ce44615ed7f21a14c36ab4518280ce27c7a37f582597424a7084dcfbadac51a9949e16905b74615d6'
  checksumType   = 'sha512'
  checksum64     = '29fc405dbc8e963f913af088a5d74e1747c23d1a2621654a8207c39c25fd58b1892584d0757be66cb3601e6650e0eb299fd67b9ee6beea9149d30d1b019c2cca'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
