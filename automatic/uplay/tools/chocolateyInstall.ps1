$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'A5D923A772AA47E3B6D39084336147809782CD3DAB0A7294E55423E175B2645D50EF3E3F3190EC2B97C5C37FAB2455FF898172181A7D754F6BB4CA1E46541D3B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
