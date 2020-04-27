$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.25.7.exe'
  softwareName   = 'Cacher*'
  checksum       = '1f21054293705d159f96a112bd01d4b0aa0c001b8ce4c89597d93cb11a5a79ebb54725dc20b61d6b9e9acd0176f41aa88f9b9a12a917edad9f5bdd19336947b6'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
