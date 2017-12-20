$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'e5376f66dfda353bdc03341275f24868b54658320c936f845c49599121e483fd0c407ec3ae5371eb055d71b9fbe16aec2c35bbf23e5e33d58482c9596fc70132'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
