﻿$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\Unit_Test_Boilerplate_Generator_v1.10.5.vsix"
}

Install-VisualStudioVsixExtension @parameters
