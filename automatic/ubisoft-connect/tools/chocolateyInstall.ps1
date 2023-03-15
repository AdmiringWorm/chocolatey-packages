$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'BF9F6712131A0CCED4DE3BF369EF934CE057084DF6EFCD3D2AC89B936B71D2D61D5AA3D72F2439880AEECC1C076E1BE54B9DE2B51D4EF7E3AC1DAED4AC9BA351'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
