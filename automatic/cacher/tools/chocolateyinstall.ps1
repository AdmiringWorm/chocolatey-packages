$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.44.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '4ea6d1b29672396d16af314422f3335ff53b3a6eaedd0afc986c09daa704bdf89ef442b702fd2fe146e80feef1dc47645f76452e74c8034dc6ec0b04fbf3f994'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
