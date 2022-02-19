$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\CodeMaid.VS2022.v12.0.300.vsix"
}

Install-VisualStudioVsixExtension @parameters

Remove-Item -Force -ea 0 "$toolsPath\*.vsix"
