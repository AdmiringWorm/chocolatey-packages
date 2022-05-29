$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd1b4150463983928e4a20dd3601e92cf9e3ddd37a5f1705a4a3d10b5922b19e979dfb12a412e6db70981c273c9a8abf4698f95f24f275439a487d3397d24e0bc'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
