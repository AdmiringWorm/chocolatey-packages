$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'F23160A0271CDA892149A8E405638D1868DB8A89992853CE0ED237BB9B50F81D357AA5E19F36BC91C7ABBAD138F01C445A6F4848179808CDEB276BDB85CDC96C'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
