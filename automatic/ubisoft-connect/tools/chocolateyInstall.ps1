$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'D13D7827DAAC4A804EED33C7B84E04D55AAE13CF452C72CD39F80F7795A59A7FD2D71EE3A57ED54ACD6D9A6B0B16F2EBC7F919EACA886B74F84498E3A0750608'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
