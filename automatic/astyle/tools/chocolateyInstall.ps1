$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsPath\astyle-3.4.13.zip"
  file64      = "$toolsPath\astyle-3.4.13-x64.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

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

  Remove-Item $pathsToRemove -Force -Recurse -ea 0
}
