$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '48BAF92D7FF2B267F8AB8B1E1960BB8A5E7724402FF39DDDBDFD2A5D58B1CFE75C5C2B041A148C6D6B0E982977F835036486A26ED9F49373B36461C63B14A75F'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
