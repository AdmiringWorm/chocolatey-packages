$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '7f503e044f893a51acda32098dae0186b5b194afefee0f1676c80ac09fac6cec498277233dae84fb9e5bbd303e2e9c962d91e5edf12d441253b5935ba3b821bb'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
