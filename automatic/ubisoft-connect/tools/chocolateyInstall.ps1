$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '4BB02B3CBFEEA14E9E3DE1E5F51F763ED882383937C941752C7C55CC7A6FA1BEE5BD3867DEE7ECE5EED901C919DC1115AA3D93764894C6FFDB241DFEC901DE9B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
