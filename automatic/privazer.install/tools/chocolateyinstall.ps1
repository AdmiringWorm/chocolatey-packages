$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '75940c3d6a348fc4f217920b35f88bf15743273b66266b8492c759216957ccb09db792e9d762fc58d608cb9efbcb2d08d793958a9dca60922d0a0481bb2bcd5c'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
