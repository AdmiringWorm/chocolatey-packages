$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '64C96EA86E7F82A68C586D9E09387DD5CEE0D692259702A1C12FB73B37D1FC3BAF8098381E1DF2AD40BAC69D7E8DDF287E9A2FBB48EBA88CE66372402F1DA6B5'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
