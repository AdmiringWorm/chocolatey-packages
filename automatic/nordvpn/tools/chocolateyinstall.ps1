$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.23.7/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = 'FAF8A18EB8A39FE63BC8AF4D0A868B0C6C3E2CCD8495E21F07DC179C537D4965A8EA38801708DD042B4E63E534DCA5CF9B2955FDF25A4DD30F3E19738EB5B22E'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
