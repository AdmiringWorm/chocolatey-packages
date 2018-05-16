﻿$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth -Compare 32) -or ($env:ChocolateyForceX86 -eq $true)) {
  throw "The software for this package does not support 32bit OS..."
}

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = "$toolsPath\BoxCLI-win10-x64.msi"
  softwareName   = 'BoxCLI'
  silentArgs     = ""
  validExitCodes = @(0, 2010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.msi | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
