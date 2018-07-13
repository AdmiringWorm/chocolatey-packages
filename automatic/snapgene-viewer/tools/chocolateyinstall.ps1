$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.2&minorRelease=4.2.1&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'ccd8e361307354de788a260c5d8dd201118ea14099ef6701a232e4804c228f14b591009c8dbdf6a89505ee5207423abc8a33edf8cc359f1d9d1bdd9613db2e05'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
