$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'CEFD6D7E23B1E597D36F9C8DCA619C107408FAD1E09E2AC674866671E2CBE725C2F8CE2631E7C6EB69475504241336FBD11A78B135B694AEE66AB6F5915F8F1D'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
