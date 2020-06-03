$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = ''
  file64      = "$toolsPath\rssguard-3.6.3-01c29b9-win64.7z"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0
