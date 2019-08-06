$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.14.5.exe'
  softwareName   = 'Cacher*'
  checksum       = 'fc9d48413faacbc0688869a83de6a7caf7ef99f0ae5067a387662ec5640001a4f417cea24b165f490dd0558196bca96d920e13206e328ef1d96c355f235c58cc'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
