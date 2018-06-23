$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://s3.amazonaws.com/download.cacher.io/Cacher%20Setup%201.5.8.exe'
  softwareName   = 'Cacher*'
  checksum       = '717a104d4fea95e5385c915618a28bfc7ba630372228e5d2a3aedbc66a36ac6b46fbf31fc05c5ca543144cceb918d19fa633698fb7ee55b4f35f22838a699a57'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
