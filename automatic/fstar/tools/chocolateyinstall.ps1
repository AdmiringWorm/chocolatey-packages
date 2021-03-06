﻿$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = ''
  file64      = "$toolsPath\fstar_2021.06.26_Windows_x64.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

Get-ChildItem $toolsPath -Filter "*.exe" -Recurse | Where-Object { $_.Name -ne "fstar.exe" } | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -Value ""
}
