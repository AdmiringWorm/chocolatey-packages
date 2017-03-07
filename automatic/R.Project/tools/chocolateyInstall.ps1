$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'R.Project'
  fileType      = 'exe'
  softwareName  = 'R for Windows*'
  file          = "$toolsDir\R-3.3.3-win.exe"
  silentArgs    = "/SILENT /NORESTART /SP- /SUPPRESSMSGBOXES"
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
