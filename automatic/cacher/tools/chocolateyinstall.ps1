$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.11.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'ba36820e0da96239094730e662eb8d22f93fadc89cc0040688132081dceb7ff8778cba9fc73da0a021828e56725ebcd8ff85448413b396de3879ced1f9a3cc76'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
