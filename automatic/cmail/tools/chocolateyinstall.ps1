$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'zip'
  file        = "$toolsPath\CMail_0.8.9_x86.zip"
  file64      = "$toolsPath\CMail_0.8.9_amd64.zip"
  destination = "$toolsPath"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0
