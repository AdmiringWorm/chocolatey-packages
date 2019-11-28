$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'B86A7DFEEA1FF35EFD71959C4178D6F557C975D8E219391EC692BA1A0D515A46D4D2BAAF90A75B3CE74EA7BCDCB56A0A385B61800E2170805AE77D99F1DE3DD9'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
