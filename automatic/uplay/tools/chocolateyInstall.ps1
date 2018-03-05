$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '298C9B37CE75AFD5D1466AF3043A5618D71AFFCAEBA60AA2F7FDA4CAF30B2B5BAF5CCA7FC9D4EA4C6CC88F922F3B94767368200DF4A8BC31148844BFBF05257F'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
