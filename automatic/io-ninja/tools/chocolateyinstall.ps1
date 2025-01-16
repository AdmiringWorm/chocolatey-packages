$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\io-ninja.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://ioninja.com/downloads/archive/ioninja/ioninja-5.7.3/ioninja-5.7.3-windows-x86.msi'
  url64bit       = 'https://ioninja.com/downloads/archive/ioninja/ioninja-5.7.3/ioninja-5.7.3-windows-amd64.msi'
  softwareName   = 'IO Ninja*'
  checksum       = 'f4e1a24c3291bf8986fb4bc6e6f7d31d5c87bedc26961ee9aca254afe369c328f528d1f9a788f973795e58283e89ee202dfa8b5549925ea51ee4e209e29b91e0'
  checksumType   = 'sha512'
  checksum64     = '48a41f0bf5f89696b6efd78965cbf632ddcc8a74a9703e324210514f0541126295fa66f1bd874e5dcfaa77e71581a47650251fbc0520afbd405f08606c51032c'
  checksumType64 = 'sha512'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
