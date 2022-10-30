$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '79c9f36bdec95dfd332e9838d38301be51cbd549675c24347dc3917ecc51fad4b5f7c2c1d543aa6a5a2023cdc95c0f4b7c4edd0051bd596652c8126344fab667'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
