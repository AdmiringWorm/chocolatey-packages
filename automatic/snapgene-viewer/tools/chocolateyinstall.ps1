$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.snapgene.com/products/download.php?product=viewer&majorRelease=4.2&minorRelease=4.2.10&os=windows'
  softwareName   = 'SnapGene Viewer'
  checksum       = '6747889e389303b96cc85fa529e5f50078dde7d11aa7eb1c3d84d4a2ae93a10590b4886e0bd466be75ceabcaa685f168b203d8cc565f7230854df26cd614355a'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
