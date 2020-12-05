$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '656efc70e34cea7defed58d666cf22bc898612f154cdcaafed73805acf800ad573abe4a042f330dfa6c1058b38b8b0e45b6afafa5f99dde802e2cc7743e65440'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
