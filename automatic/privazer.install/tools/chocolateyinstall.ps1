$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '4b53e8a57b8bc44bb4320014a2e14807d0b8ea4913505d986d78812bab078f28e157457a61f4104069dd655efc6f8e13374cc931c14556cb02bd249ecba05259'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
