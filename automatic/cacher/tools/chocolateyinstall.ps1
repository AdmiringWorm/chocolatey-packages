$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.6.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'cb48fca7a5c92dc7e6d58aacc2727874979b2327a1816bf8e4e12e96b6d818a9ea549e70b818924f7dfb378aa13da1f49621c3b879eb0ea8e28658c15fa97b5e'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
