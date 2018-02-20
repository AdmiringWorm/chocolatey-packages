$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '813F78DA20FC160BC9E8CC06D978E9B33A273464D511D0C81A58B44EE0016784561D2EA416E4C02F1B6D26DC916DBBC069FD26B3CE147100801A789DF4553CF1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
