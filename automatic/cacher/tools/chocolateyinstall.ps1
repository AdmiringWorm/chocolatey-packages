$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.45.3.exe'
  softwareName   = 'Cacher*'
  checksum       = '7954101fc28d1c5d330aef73b2d75afb0c509509b2426946207902dec324ec7fe5207038d6a37acb9c3f10a281070cb68e916c6f93a8bde55b091eceb414eb35'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
