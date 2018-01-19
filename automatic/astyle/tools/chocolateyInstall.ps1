$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.zip -ea 0

$pp = Get-PackageParameters
if (!($pp.KeepAllFiles)) {
  $pathsToRemove = @(
    "$toolsPath\AStyle\build"
    "$toolsPath\AStyle\doc\install.html"
    "$toolsPath\AStyle\file"
    "$toolsPath\AStyle\src"
    "$toolsPath\AStyle\README.md"
    "$toolsPath\AStyle\CMakeLists.txt"
  )

  rm $pathsToRemove -Force -Recurse -ea 0
}
