$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'd031b038884e63241d4c616f116cc276010c7f5a9b62b1fd1f99ab030df1e16a3252c68add1a7c71a63825b951c94e076d211ff2ad978ab123dba3a326ac24e8'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
