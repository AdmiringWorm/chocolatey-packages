$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=4.1&minorRelease=4.1.3&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'e60b1e78c9dba55790b56e788db685d893e47179dd5db1a2223d958a9b6192a08286ffa918433254637c28c26c25edcb5d64051c7b69104477e4818a293328d7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
