$ErrorActionPreference = 'Stop';

$packageName= 'IO Ninja'
$url32          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.2/ioninja-windows-3.7.2-x86.msi'
$url64          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.2/ioninja-windows-3.7.2-amd64.msi'
$checksum32     = 'b7cc8869dc13c7508f336133305ea8ed3aa0d15dd0359d8fe96cf009082f2342'
$checksum64     = '857d53dc022e3173d60cda334d74fb88c42bd6e514732460dfee2dff7fd8a390'
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
