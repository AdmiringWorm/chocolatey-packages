$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'B7F5ADDC11566EC271EE113B8B7E6F7878895709C52ACE514F9B28A783E5B0DECC9ADC6CFA52D82D6F378EB65BFA5007DF02A96536EB7AFFC4E1ABD189EEA0BB'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
