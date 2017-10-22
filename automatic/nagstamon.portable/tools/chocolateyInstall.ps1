$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  file           = "$toolsPath\Nagstamon-3.0.2-win32.zip"
  file64         = "$toolsPath\Nagstamon-3.0.2-win64.zip"
  destination    = $toolsPath
  validExitCodes = @(0)
}

Get-ChocolateyUnzip @packageArgs

Remove-Item "$toolsPath\*.zip" -ea 0
