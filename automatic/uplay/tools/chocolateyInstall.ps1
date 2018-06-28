$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'D28D0FC6ABFCD003FB01537DA97119A45CD48E9232D9FA313DAFBFDB591F3C3A70AE43D4C35F3B0DF544203014F6C52B5AFD64792598E4894DC8FA41AA520E93'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
