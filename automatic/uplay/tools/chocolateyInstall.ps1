$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'AAF1E40A3A7E55294D43F4A84636ECC5493AA1102F5BFC617AB491C74C13A0EA10774C4239D2D83F3CFF6E30E01B9745830A8F47D43A23887F343AD0FB3F56D8'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
