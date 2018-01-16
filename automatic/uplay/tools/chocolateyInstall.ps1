$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'BAC786825A8D50FCAACECB306DA3B38D14F2A6889D591680016F56CAC1BFC7A30FE0E44E02655741D125285ED2D45CF7B43376FB8A95167D32319F0DBC996798'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
