$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '2460C9330B538AC02C4B3F0293BB5068CD321402542141DBF32C31D6F87361CC92A9FB1D46ED4649910AD9F80A9AA4EA5EEAAC29078FC405E5D695837CD89F16'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
