$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\Unit_Test_Boilerplate_Generator_v2.5.4.vsix"
}

Install-VisualStudioVsixExtension @parameters
