$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\asp-net-mvc-boilerplate.vsix"
}

Install-VisualStudioVsixExtension @parameters
