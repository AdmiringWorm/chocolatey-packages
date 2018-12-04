$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.2.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'f363171e45103202c0f0d6b257ae78f73550c47e469dd4613f003fca04b49b8bdb1edf828eef5168718387ff4510f1ac1c7e45915990066134502bbaf694d249'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
