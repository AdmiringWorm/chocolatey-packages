$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
  file        = "$toolsPath\cmder.7z"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.7z -ea 0

Install-ChocolateyPath $packageArgs['destination'] 'User'
