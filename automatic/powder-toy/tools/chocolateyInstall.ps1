$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'zip'
  file        = "$toolsPath\powder-win32.zip"
  destination = "$toolsPath"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $packageArgs['file'] -ea 0
