$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '452140C7BE189682B0AFDFDEE89D693A6F7F389DE7CFED44B5099D0038D244ADA8610D6CF408086C95F4E7FD0DB910249F8351A9F29EA8CCC35B3F2CEDA4F243'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
