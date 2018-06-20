$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '42A66688CA466C9EC6F815AC97DFE7BE4E32289BB3701665C256CD44CEAD905D18EAFC9F108626458FB7103CFA57F986C686F3C930263236071C419C5157D000'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
