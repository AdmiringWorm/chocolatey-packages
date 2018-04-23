$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.9&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '85a7c054740d3c3ce16e47c9971bc1848d77ff3d3c0dec75a66a7183052c8e83dc49f5ad19e9314c5a339dee1a5ca7dd1290fd5fe659e6a327396b59ac011a49'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
