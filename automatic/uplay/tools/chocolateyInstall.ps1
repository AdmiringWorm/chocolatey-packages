$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '1D6CFC98FC0C1D8D692FC96EF918A773ED8B2F24E9010AF93B5FFDBB3AD625ADBD6108C8557DB68F5575068677401E272D6768968BF265EC3419995E9AB1186B'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
