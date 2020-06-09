$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%202.29.1.exe'
  softwareName   = 'Cacher*'
  checksum       = '53cd4c2bf446663ef4fafc932934ffff3dd6d0035a8cd64f14fde09d837451f57568fce109efc9846d76564a0e4e6ae64d52676f15928414118ba2f018b3f967'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
