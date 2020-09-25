$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '6b14b19974f2da603c211b3d64276d9748e36af6b121afcd835f09d2eee817b6ff39562a4460f65fe2e8839552e4217da596a92d0e2bb0c63be0c2257403ae16'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
