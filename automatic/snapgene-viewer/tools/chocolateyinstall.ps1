$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.5&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '459a77e5d731b6c990a55125539ea803dcfc01ad2044b5932c2d412ddcdb3ab1ea315dbfffcd8aa1e1d42a643db6fc70e043a290a8c7f6239d75bc6bc7ca64a2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
