$ErrorActionPreference = 'Stop';

$packageName= 'IO Ninja'
$url32          = ''
$url64          = ''
$checksum32     = ''
$checksum64     = ''
$checksumType32 = ''
$checksumType64 = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'IO Ninja*'

  checksum      = $checksum32
  checksumType  = $checksumType32
  checksum64    = $checksum64
  checksumType64= $checksumType64

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
