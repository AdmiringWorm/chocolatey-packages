$ErrorActionPreference = 'Stop';

$packageName= 'IO Ninja'
$url32          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.0/ioninja-windows-3.7.0-x86.msi'
$url64          = 'http://tibbo.com/downloads/archive/ioninja/ioninja-3.7.0/ioninja-windows-3.7.0-amd64.msi'
$checksum32     = 'f723a57877bfbe2d39db1185afba78109f9ffcdb4b7af9ecf794a490e3b57f5a'
$checksum64     = 'cd8be7dad1e85938ff4843e1ec4f6794680b5c08eb97964d7133a1f69e8e20d0'
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
