$ErrorActionPreference = 'Stop';

$packageName= 'IO Ninja'
$url32          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.4/ioninja-windows-3.7.4-x86.msi'
$url64          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.4/ioninja-windows-3.7.4-amd64.msi'
$checksum32     = 'be1231ce67a08e91401ce73f57d49f261b20b5ad4cbb8149bedd0181256ad7cc'
$checksum64     = '1ab0b2f916f438d6a923636fbc83793f1f0495341ceb7bc91dc3e7697fb61ef9'
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
