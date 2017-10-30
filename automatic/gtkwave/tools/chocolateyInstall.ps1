$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'zip'
  file        = "$toolsPath\"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

Get-ChildItem $toolsPath "*.exe" -Recurse | % {
  if ($_.Name -eq 'gtkwave.exe') {
    Set-Content -Value "" -Path "$($_.FullName).gui" -Force
  } else {
    Set-Content -Value "" -Path "$($_.FullName).ignore" -Force
  }
}

rm $toolsPath\*.zip -ea 0
