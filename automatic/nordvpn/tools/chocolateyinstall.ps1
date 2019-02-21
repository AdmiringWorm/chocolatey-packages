$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.20.12/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'B3D8FCCF54147A570E9084DF6CF34655D1DB9F5AA0EBD9696148C70F7877E5D7AE6B2A0E3EF91ADB4264719E7E6E3498269404D34C9F12CB7CF480375B1EA3C3'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
