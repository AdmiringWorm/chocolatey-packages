$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'ee4fba0d7654cb8c2984e9f8a53528b2dd3fe5ec297d77552d13b10e02f59f59cfd23aaa146ab33fbe1aa14a320e24ae7284eb3f660106878243a650160339f6'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
