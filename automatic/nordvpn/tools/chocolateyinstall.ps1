$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.26.17/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '5B99CA2C9DBAEE8FC96A84CAEE9C7C4FA809B50C5A998F8662F337FED78FCB9999A57CCC3EC3BE0957CEE7FB0210F929680DCC67B5642C9E38FDFC87B79539AD'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
