$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.3.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '4cbebd0a9a75d1842929196cd2b150e23507c0af11980e5f3fc46cf1bdb55efe08f4ea5d47404b6a267cc648d6c4357f1243ea9463a6221d9b15593344e3107f'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
