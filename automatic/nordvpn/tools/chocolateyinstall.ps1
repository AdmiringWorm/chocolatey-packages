$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.22.4/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'CDE650EA3B4BD0D1768C21CAB0425361513C9FAF09CB5253E55FF4A318D990B8F01363CEF906F6D0FC065D6AE5B835E745AC8A5188C28E6D2E88B78A5C242162'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
