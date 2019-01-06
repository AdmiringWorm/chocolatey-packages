$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.3.3.exe'
  softwareName   = 'Cacher*'
  checksum       = 'f52bdd42f6e013d75563fd7083b83fb65b8905c12e2939e12732469edaf6581aa746a0a803ac5e4a4b7cb75cc40ab061489d9a8d3a5aea1bd7460f8a1e7bb6ed'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
