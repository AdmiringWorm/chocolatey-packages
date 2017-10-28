$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\metapad36LE.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.zip -ea 0
