$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.3&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '57617d19199922429e6c420f8d720dae142470a44cbf6a330ead03b8aa830471de830dda5d36a5e10ce0682f5abb8a132c4f372f9bd58677064050d0ac1c1f9e'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
