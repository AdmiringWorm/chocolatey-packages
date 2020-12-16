$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://cdn.snapgene.com/downloads/SnapGeneViewer/5.x/5.2/5.2.4/snapgene_viewer_5.2.4_win.exe'
  softwareName   = 'SnapGene Viewer'
  checksum       = 'aa3601005009e7046db6932472c463cff11acb42938f38cdf9f2933aba97c81532470238b766958881b910617d7791f6255cb686b32224fd08f8917a604593f7'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
