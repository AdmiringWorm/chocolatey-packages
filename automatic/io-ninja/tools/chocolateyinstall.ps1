$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.15.0/ioninja-3.15.0-windows-x86.msi'
  url64bit       = 'https://tibbo.com/downloads/archive/ioninja/ioninja-3.15.0/ioninja-3.15.0-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = '3c3c2ee59e6d9eef585ddc818f1762f6f50ced0b022a1d70c52b125765db8942ca940e7e2eb186b5c0c3af92d5425dbae5f7e473b043e7905b3895083f373e1d'
  checksumType   = 'sha512'
  checksum64     = 'b5ede912489e038865a124a977988342e324a15ad86a1693fecb24c9eec508c28a39fe9782337b3538bb97ba02575cef081b2aa14fa299dbf8a2e880716054f9'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
