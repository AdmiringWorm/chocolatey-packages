$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\"
}

Install-VisualStudioVsixExtension @parameters

rm -Force -ea 0 "$toolsPath\*.vsix"
