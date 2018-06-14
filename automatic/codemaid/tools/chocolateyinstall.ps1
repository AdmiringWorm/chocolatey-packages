$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\CodeMaid.v10.5.119.vsix"
}

Install-VisualStudioVsixExtension @parameters

Remove-Item -Force -ea 0 "$toolsPath\*.vsix"
