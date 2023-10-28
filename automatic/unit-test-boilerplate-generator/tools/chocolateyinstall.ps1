$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\UnitTestBoilerplate_2.7.4.vsix"
}

Install-VisualStudioVsixExtension @parameters
