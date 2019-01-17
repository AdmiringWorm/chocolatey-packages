$ErrorActionPreference = 'Stop'

$runningProcess = Get-Process -Name "sheepit*"
if ($runningProcess) {
  throw "The SheepIt client is running, please close it before removing the program."
}

$toolsDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
if (Test-Path $toolsDir) {
  Write-Host "Removing $env:ChocolateyPackageName tools directory..."
  Remove-Item -Recurse -Force $toolsDir
}
