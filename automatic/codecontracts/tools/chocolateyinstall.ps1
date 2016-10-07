$ErrorActionPreference = 'Stop';

$packageName= 'CodeContracts'
$url        = 'https://github.com/Microsoft/CodeContracts/releases/download/v1.10.20606.1/Contracts.devlab9ts.msi'
$checksum   = '5a2e44751a650a8442dfe1a41484e960b46eaa1a55b25672f6537a1d59015f5b'
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
