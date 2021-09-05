$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'bd5c206c5fa55b76262580c4cf107830111122501a4d6bdae5ce1ae1d39529d1aeef423921ec07eb10aa707ee8cf0e78edb4e4edaf0cd1eab882e645a3d3cbe3'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
