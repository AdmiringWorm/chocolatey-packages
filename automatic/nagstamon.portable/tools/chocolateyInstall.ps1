$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  file           = "$toolsPath\"
  file64         = "$toolsPath\"
  destination    = $toolsPath
  validExitCodes = @(0)
}

Get-ChocolateyUnzip @packageArgs

Remove-Item "$toolsPath\*.zip" -ea 0
