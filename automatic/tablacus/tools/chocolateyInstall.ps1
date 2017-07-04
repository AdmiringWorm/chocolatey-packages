$ErrorActionPreference = 'Stop';

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = 'tablacus'
  file        = "$toolsPath\te170703.zip"
  destination = "$toolsPath"
}

Get-ChocolateyUnzip @packageArgs

rm "$toolsPath\*.zip" -ea 0 -Force
