$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.30.4.exe'
  softwareName   = 'Cacher*'
  checksum       = '37e34911717d4d68f943f5bc7368c6fad817ae296af9a8763345e4a9d945cf7d4f09cff31205ec042342eb41125eb056f3340361cff30105120e20de0111c74e'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
