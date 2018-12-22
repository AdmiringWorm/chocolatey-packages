$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.11&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '263386281f19c149ee700ac75158416407f5f3c0c972fd3ea3a458573803943d7fe2ce4fc5594ee01db5db3b5bac5ac72c5c1eee913a1c52c0c75b37dba4bfd1'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
