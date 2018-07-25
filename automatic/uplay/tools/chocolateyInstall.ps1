$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'E02D8C38305649E288DB5F65A9A3C0C69388F5F38F638905FEFEF11150E9F6F4C18C056DC5DAC9D99C6E6ACDC496A34135A9682D6DB247F8D68B3FEDF55F93C0'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
