$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = $toolsDir
  file        = "$toolsDir\"
}

Get-ChocolateyUnzip @packageArgs

Remove-Item "$ttolsDir\*.zip" -ea 0
