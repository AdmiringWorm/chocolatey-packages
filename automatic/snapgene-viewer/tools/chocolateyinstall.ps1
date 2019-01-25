$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/local/targets/viewer_download.php?majorRelease=3.2&minorRelease=3.2.1&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '1b915a61b4c4c6a2da93d9f6dc34f0e62047e3cd52449d4639354d73b2098651847e1baf6cbff437cae406820104c6af115066691a5e2ed1e3134e3232c2acfd'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
