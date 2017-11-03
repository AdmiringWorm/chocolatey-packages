$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.0&minorRelease=4.0.8&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '131c030fd5edb49de4cbb92741d1569f710bbc937c05eee1fa1afcd4c9feeddacc851661a6d79051f2bbcb33968492853d152209bd399cc63f176624302ade3b'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
