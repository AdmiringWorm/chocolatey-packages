$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '4877b7d28e7105b07460446772941d8dc24a0d5d68d7caba338914a2e52bd8dd797158b2ac6b24ce3638de47a3af4686e68ffb867b05157c46e469d14ba93117'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
