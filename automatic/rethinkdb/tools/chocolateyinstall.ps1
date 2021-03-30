$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = $toolsDir
  file        = "$toolsDir\rethinkdb-2.3.6.zip"
}

Get-ChocolateyUnzip @packageArgs

Remove-Item "$toolsDir\*.zip" -ea 0
