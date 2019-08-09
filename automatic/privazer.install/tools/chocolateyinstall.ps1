$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'e24a317075d53224e918bcb93457ddb41ae3fa1b72e9c9dcd217e64fb2f6b213c0c1444a619c279f061aea9c54e69fe5e97152cfec075919e50c40ad59677c55'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
