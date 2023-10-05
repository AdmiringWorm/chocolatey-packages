$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.4.1/ioninja-5.4.1-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-5.4.1/ioninja-5.4.1-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'f972a4756122bd5f3746029445302360a7be97898c088a361994de2e370e449e7abe4e252d37d7a358da83f80371a0f38c3d7bdf2bd80a4872236c999cb88d8e'
  checksumType   = 'sha512'
  checksum64     = 'daa962b4ba6cd0f8b55d2545ac8bfb0d7af7f9a5cb8bfbef3057b57e36b7606dc4ce5758c37d9b51d4dab331a6932e942988312b7311e4e0f18223f618b8c7ad'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
