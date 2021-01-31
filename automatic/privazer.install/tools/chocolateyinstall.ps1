$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '17b7770c8c39393f59247dcebe34b0a1f775a23d013a102187902fab1af7bbebb8082bf46beaf6f5751b39a9c2e17a07dc70d044bbc5c20e61da67127b66b91a'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
