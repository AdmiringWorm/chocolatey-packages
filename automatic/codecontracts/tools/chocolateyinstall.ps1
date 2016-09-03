$ErrorActionPreference = 'Stop';

$packageName= 'CodeContracts'
$url        = 'https://github.com/Microsoft/CodeContracts/releases/download/v1.9.10714.2/Contracts.devlab9ts.msi'
$checksum   = '6a0bddc2bf87c8a7a9c4c23dc043d43c43f2d49ef90951585f5a0deb2d069315'
$checksumType = 'sha256'

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
