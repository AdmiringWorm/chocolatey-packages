$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = ''
  file64      = "$toolsPath\fstar_0.9.6.0_Windows_x64.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

gci $toolsPath -Filter "*.exe" -Recurse | ? { $_.Name -ne "fstar.exe" } | % {
  New-Item -Path "$($_.FullName).ignore" -Value ""
}
