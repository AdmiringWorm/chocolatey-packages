$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '5718bc81ab41ae37fbab7f673979435d5605f54a8c4a2e41aad11947a1b1a09c627c83e20f1a8f466e12652a4bf3bf8e9387e2db8c2d3f7ebea977f02bbaf0e1'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
