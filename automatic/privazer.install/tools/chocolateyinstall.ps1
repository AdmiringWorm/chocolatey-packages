$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'af73c497508cfd533a4e3c4956fbfa591e198a43f3934656025925196bf0f653a2eb5d862931600185198889c41069c153ade417ea6f5e57944e8df8a38b23a8'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
