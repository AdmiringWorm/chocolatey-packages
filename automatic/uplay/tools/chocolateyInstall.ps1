$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'DE6A6C43E970FA671DF2A9FA8CC3A7C7C86EF9940C825D7ECFB19ED83F20621BF5B48C7DBF4FCAB30E60CB98882413D37342A807698F9DC4BDCEFB95F4508950'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
