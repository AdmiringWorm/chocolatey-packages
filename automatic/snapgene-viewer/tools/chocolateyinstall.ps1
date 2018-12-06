$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.8&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '4a64ab7134bd69e14fe36febb703da92549b9a1344ba27cbf149ca09aef6884dd0f687860684a1d0dadad20716ee2d6d4943d568c6dcdacdec3c2e7e65432a09'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
