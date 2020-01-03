$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificate..."
Import-Certificate -FilePath "$toolsPath\nordvpn.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.26.8/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '47D5C37646E313B8C10DAB7EEB3CF75E05B2BF3A16CA1F58ED017E51FFAF82D061629345C9DB675E8E2E58843D6BE5FD5B49CD8040BFC9B819DE26D4C8565629'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
