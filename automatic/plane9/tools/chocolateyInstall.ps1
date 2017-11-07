$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://s3.plane9.com/releases/Plane9-2.5.1.3.exe'
  softwareName   = 'Plane9*'
  checksum       = '6e98b95d4ac555072213e2d94eaf70f9e7d4503bce3e250738b69eba21bb32da9d793cb31b04bdae1bb475c9d711194b739a944a983b9ad60af6f42237228c73'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
