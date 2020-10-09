$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://cdn.snapgene.com/downloads/SnapGeneViewer/5.x/5.1/5.1.7/snapgene_viewer_5.1.7_win.exe'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'ced76e6d74f6d6a6b56d01700d50d3af89c8d1bb16d37ba8d34e6bb7349e97fb2f0b3bdd657544bec220a9d092c3761916f16b035e7d34f29a36870e63b4b92c'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
