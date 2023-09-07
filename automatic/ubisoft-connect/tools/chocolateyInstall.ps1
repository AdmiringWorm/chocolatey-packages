$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '3D9BD7FAFD44BE92F780FCDAC8C5FCD47D6F2BF4B9CC6CF0D8D5301838A3BA943324300A01EEAC049DC66324CAE0906EEE145132C19228465AA77F3487A94099'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
