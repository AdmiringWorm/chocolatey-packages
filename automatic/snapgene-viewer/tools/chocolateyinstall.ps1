$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.4&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'b179780e49ec25cffca4c93428195235df1ba97ab40c8ac821335ab3bcb9358fbb12a77ae66177880e096e0cd9d05c0203ff13a83045c60f4ad8e74b359999cc'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
