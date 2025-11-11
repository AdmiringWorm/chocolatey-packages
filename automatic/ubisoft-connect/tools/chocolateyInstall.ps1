$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = 'AF4A1E7574F4A2DB79B05C4C595144AD79AC2A1F56612B9041ED8D566BCF6819AB6C01FA0FFBE44C6DB558C2AAB2F033AAD6FE97C819B1D270A73F1DF1E283D6'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
