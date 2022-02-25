$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'd168b5aafff7064b4aca491b293eeb302a243c18c6e0a78de15fcb7cc50974ba3fb1dd2226179995df72149682f352d5e13d3edd023eb62138778874b336cdea'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
