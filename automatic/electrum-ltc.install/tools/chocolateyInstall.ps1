$ErrorActionPreference = 'Stop';

$toolsDir    = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'electrum-ltc.install'
  fileType      = 'exe'
  softwareName  = 'Electrum-LTC*'
  file          = "$toolsDir\electrum-ltc-4.0.9.3-setup.exe"
  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
