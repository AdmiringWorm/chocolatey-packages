$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://cdn.snapgene.com/downloads/SnapGeneViewer/5.x/5.2/5.2.3/snapgene_viewer_5.2.3_win.exe'
  softwareName   = 'SnapGene Viewer'
  checksum       = '71d055c4f64fdaa298f9930000bd5b4a55f6857f0f9d8c47fe47b2651419a7e4f52bffba8c9ba1ef20a839622513b5104c8f6c3b002b4ed1d7b3becaec9c1522'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
