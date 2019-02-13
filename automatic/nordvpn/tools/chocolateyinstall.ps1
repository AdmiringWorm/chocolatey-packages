$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.20.11/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'AE510B2D15AD75FD9D7520D4CDD6853622C07094ED8C7B245D015A93881214D21434FCEED0F3DC0B24A3DE7D835DFF177A5D3017E687721A5036CDC66389991D'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
