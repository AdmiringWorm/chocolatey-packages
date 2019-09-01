$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.17.0.exe'
  softwareName   = 'Cacher*'
  checksum       = '83ef8fba53e1010ebd2c4034d58d4c6e563dc196070fec823d92a82fc69a91d9118bb1a4ec498274043f8f9b741def18c7a13131869d3f80605c4a684426810a'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
