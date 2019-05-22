$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.22.6/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '638C61A96B7A997D9D62928E5F72E9FEF082216295DCCCBF32D425B3C51A1D04EB7ADE03D7C6B224A91F6ED3B885A555E99D33AB2EE2F62C22E124ED3F8CD66B'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
