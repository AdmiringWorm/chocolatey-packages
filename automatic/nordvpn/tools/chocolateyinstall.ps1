$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.28.13/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '93CC77506963CB204B745DF8C8E388FA806F419784219ADB4561E9B2E4B495A3946D667575542FA36D7E1FC795BA8EB6C4096EF7C8E2BF75F9E86A85473D68D7'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
