$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '72CA64A05B34D002DE2795AF55E6A9B0A2F846D278D27C44A92ABF59BE7742722077416DC28F3ECDB4150EEF1339B4CD120A8E37FBA59F8364E5C95892688873'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
