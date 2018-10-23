$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://downloads.nordcdn.com/apps/windows/10/NordVPN/6.18.5/NordVPNSetup.exe'
  softwareName   = 'NordVPN*'
  checksum       = '1894785444E0D656906D9EC7609D3123437EE5284E8B1793061215110703E9F06325D1B65AA87BE61B348D9552CB96C8E235D65DAAE676034471B5469E417C4E'
  checksumType   = 'sha512'
  silentArgs     = '/exebasicui /exenoupdates /qb /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
