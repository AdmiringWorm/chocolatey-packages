$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.2&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'a534e24faa2610d7d624f3549c546fc14a02f39375ecc86977844bedc8041cc15f97f7e105c463c0713aadc7769b64d2d3fd27bd56a1b5b56badb87616e9bbd2'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
