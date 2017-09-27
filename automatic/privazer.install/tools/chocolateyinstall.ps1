$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '49398e34fe86f43a1cca9aebb5e9ebe2201093c9dd2d02aee94ee6e554160192edca113f92b1c344f657538357bff0a97426863df0ffcf70a0e8c160653c07b3'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
