$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.0&minorRelease=4.0.7&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '2a10a39b168fbc9f182463b12439cee504a92923d540cdcabfe4a0a98f99ebb6a9fd644d5d1d311edd38bcb3d54fa262c4d381db512bcc65272817bdec8ac3cb'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
