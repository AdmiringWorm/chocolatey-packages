$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\QNapi-0.2.3-portable.zip"
  destination = "$toolsPath"
}

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem $toolsPath\*.zip | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }

Get-ChildItem $toolsPath -Filter "7za.exe" -Recurse | ForEach-Object { "" | Out-File "$($_.FullName).ignore"}
