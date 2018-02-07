$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = 'CF395DDF0FB52225FEF84CA6E8EDE3D9F2B93CC450419F214AA12D74291ABB043AF7116952D4B4EF4E71AF1A63E812070DC35BA4FA6D9E1D88577E153D09A837'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
