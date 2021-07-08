$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd4aa7cfd0367a87066c7956d5e2d636c488653ece727162620355902ddccab1d741428ea491c88181e745b367818db23a814e3852d711930ae77737f01e05bc1'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
