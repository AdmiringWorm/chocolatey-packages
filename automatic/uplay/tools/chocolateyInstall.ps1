$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '56E9151F6736469AEBE686892F267241A05DF6573852028DAB4485C87D603E51080D1E2D6B944D561A0B534AA6936D9FC4570F54F20F9835A91C73EFBFCE0295'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
