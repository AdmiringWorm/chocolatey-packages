$ErrorActionPreference = 'Stop';


$packageName= 'xvid'
$url        = ''
$checksum = ''
$checksumType = ''

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