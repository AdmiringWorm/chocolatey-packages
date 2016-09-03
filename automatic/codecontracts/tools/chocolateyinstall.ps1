$ErrorActionPreference = 'Stop';

$packageName= 'CodeContracts'
$url        = ''
$checksum   = ''
$checksumType = ''

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  url           = $url
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  checksum      = $checksum
  checksumType  = $checksumType

  softwareName  = 'Microsoft CodeContracts*'
}

Install-ChocolateyPackage @packageArgs
