$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'xvid'
  fileType      = 'exe'
  softwareName  = 'xvid*'
  file          = "$toolsDir\"
  silentArgs    = "--unattendedmodeui none --AutoUpdater no --mode unattended --decode_divx yes --decode_3ivx yes --decode_other yes"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
