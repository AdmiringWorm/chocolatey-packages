$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$unScriptPath = Join-Path $toolsPath "Uninstall-ChocolateyPath.psm1"

$installPath = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

Import-Module $unScriptPath
Uninstall-ChocolateyPath $installPath 'User'

if (Test-Path $installPath) {
  Remove-Item -path $installPath -Recurse -Force
}
