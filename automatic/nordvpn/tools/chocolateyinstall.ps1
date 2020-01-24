$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.26.14/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '2DC39358AB9C38F4B2D2016F1ADEDDD57AEC61DC7796AC1E70A28CB47857F4402FF6EC0D0EEE5564F6F70BADBA1B5C4F68F0743C0CAFC3EB11B5058C5D932DE5'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
