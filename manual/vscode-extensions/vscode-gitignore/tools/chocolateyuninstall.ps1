$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)
. "$toolsDir\Uninstall-VsCodeExtension.ps1"

Uninstall-VsCodeExtension -packageName $env:ChocolateyPackageName -extensionName "codezombiech.gitignore"
