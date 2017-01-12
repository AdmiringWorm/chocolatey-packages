$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = ''
  fileType      = 'exe'
  softwareName  = ''
  file          = "$toolsDir\"
  silentArgs    = "/SILENT /NORESTART /SP- /SUPPRESSMSGBOXES"
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
