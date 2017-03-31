$ErrorActionPreference = 'Stop';

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = "$toolsPath\Install_Enki.exe"
  softwareName   = 'Enki*'
  silentArgs     = '/SILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force -ea 0 "$toolsPath\*.$($packageArgs.fileType)","$toolsPath\*.ignore"
