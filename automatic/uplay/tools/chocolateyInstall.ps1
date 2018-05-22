$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '509402B54B78F017681D2713601B3A8C73F21161987E4DD353E8EB0B71A71BB639B8147394511B04FCE3ED49D83B7DD5783CD37057ED28432D4917AA5E482DEF'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
