$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.23.10/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '6096E1C44FD190205904834706C6EC4868616E079B6696F86BF0C973FFC5B3FB4697E20B404A31D64D132A52A9F6E2B00D9476BE724E161CDCE1DE263CFF7188'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
