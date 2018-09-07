$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'zip'
  file        = "$toolsPath\gtkwave-3.3.94-bin-win32.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

Get-ChildItem $toolsPath "*.exe" -Recurse | ForEach-Object {
  if ($_.Name -eq 'gtkwave.exe') {
    Set-Content -Value "" -Path "$($_.FullName).gui" -Force
  } else {
    Set-Content -Value "" -Path "$($_.FullName).ignore" -Force
  }
}

Remove-Item $toolsPath\*.zip -ea 0
