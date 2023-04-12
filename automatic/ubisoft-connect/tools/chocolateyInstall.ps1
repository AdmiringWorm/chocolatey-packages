$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '34B97755CBAAAAEA2B7C2551A9AB6971EAAA01BAF886620E0A52CBFF7B029C74BFE5DA1930FBF370982C3009A5293AAABF5055286F53313D0802FF8D94545B74'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
