$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '134AC093E85C5E0B293D9D43F468F8FF8CDE41D5228574583168808017D3FA574A0EED2B0C828D38DF349C22F1B513B7E6C55D7EAE890D29BF287A4B3BAB2060'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
