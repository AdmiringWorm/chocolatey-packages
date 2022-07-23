$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'e920866233c45858a19a5c3dbb20bb4923947ecefcd5116eff1fb26c0787bc2c21995ea756827fdb1a279e30914bcbec1a5127b6789cecf1fb7e4614a345e4bd'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
