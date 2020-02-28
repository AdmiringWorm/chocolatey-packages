$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\Unit_Test_Boilerplate_Generator_v2.3.0.vsix"
}

Install-VisualStudioVsixExtension @parameters
