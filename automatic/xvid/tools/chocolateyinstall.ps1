$ErrorActionPreference = 'Stop';


$packageName= 'xvid'
$url        = 'https://assets.xvid.com/assets/Xvid-1.3.4-20150621.exe'
$checksum = '88263578d2c3e2dc1e02116a1fb5d9238843b9d84aa371a0f5b32f1b2507524e'
$checksumType = 'sha256'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'xvid*'

  checksum      = $checksum
  checksumType  = $checksumType

  silentArgs    = "--unattendedmodeui none --AutoUpdater no --mode unattended --decode_divx yes --decode_3ivx yes --decode_other yes"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
