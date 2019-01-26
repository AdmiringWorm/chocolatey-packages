$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.5.5.exe'
  softwareName   = 'Cacher*'
  checksum       = 'ad140b0ae96c2bae8c9bb218cab412690754997c1143ac8d2cd6eef1df567d3744d898e0e2cab7c2f1b4ff06f277a1a23ceee7f46345f4b05d3a755b9bf24933'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
