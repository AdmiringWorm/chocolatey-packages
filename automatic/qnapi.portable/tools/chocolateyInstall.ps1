$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\"
  destination = "$toolsPath"
}

Install-ChocolateyZipPackage @packageArgs

ls $toolsPath\*.zip | % { rm $_ -ea 0; if (Test-Path $_) { sc "$_.ignore" } }

ls $toolsPath -Filter "7za.exe" -Recurse | % { "" | Out-File "$($_.FullName).ignore"}
