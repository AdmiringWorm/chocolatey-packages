$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.20.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '8e9264975d2fd0e3241d0052a9af65bea7c3ac8a4c88523eef3fafa34414a3cf467c151ac8d6bf14f347236725fa0d995d2e3c0a9c3e940025fad0dc642a348c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
