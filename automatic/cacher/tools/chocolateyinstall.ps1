$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.29.0.exe'
  softwareName   = 'Cacher*'
  checksum       = 'a4e277ec12b53dda62b92b1fcf253e24123596cf5d3771e11dd4d2595ffa50d31c13cf2e0515031283298dbe5177dfb10e1ecdce75af009b4c391336ab819ab0'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
