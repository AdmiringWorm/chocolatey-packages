$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)
. "$toolsDir\Install-VsCodeExtension.ps1"

Install-VsCodeExtension -packageName $env:ChocolateyPackageName -extensionName "hashhar.gitattributes"
