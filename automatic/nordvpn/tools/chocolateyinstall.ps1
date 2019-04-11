$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.21.8/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '1F36224D3E82574D8B6D20B14971B94A4EC2B8B4A8D0632D507E8F01242514109F69FC4F49E46C3364885B5D5F4877E749A17CDA35C9C1091272ED5F4804DA39'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
