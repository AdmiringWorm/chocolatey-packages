$ErrorActionPreference = 'Stop';

$packageName= 'IO Ninja'
$url32          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.6.7/ioninja-windows-3.6.7-x86.msi'
$url64          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.6.7/ioninja-windows-3.6.7-amd64.msi'
$checksum32     = 'e0b56eab7e3903e7ea7c7c6e36398cc159bb7e72a193bdda15644f8eb3025a4b'
$checksum64     = '99111503b83192cfc30e10242b6eaf40b9eb8f1c08db9b273eaae45051a88429'
$checksumType32 = 'sha256'
$checksumType64 = 'sha256'

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
