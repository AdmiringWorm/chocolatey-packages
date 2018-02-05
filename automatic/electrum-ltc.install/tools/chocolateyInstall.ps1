$ErrorActionPreference = 'Stop';

$toolsDir    = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'electrum-ltc.install'
  fileType      = 'exe'
  softwareName  = 'Electrum-LTC*'
  file          = "$toolsDir\electrum-ltc-3.0.6.2-setup.exe"
  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
