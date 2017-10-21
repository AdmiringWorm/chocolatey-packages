$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://github.com/Microsoft/CodeContracts/releases/download/v1.10.20606.1/Contracts.devlab9ts.msi'
  softwareName   = 'codecontracts*'
  checksum       = '5a2e44751a650a8442dfe1a41484e960b46eaa1a55b25672f6537a1d59015f5b'
  checksumType   = ''
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 2010, 1641)
}

Install-ChocolateyPackage @packageArgs
