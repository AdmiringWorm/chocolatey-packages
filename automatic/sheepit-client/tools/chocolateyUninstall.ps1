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

$appPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\sheepit.exe"

if (Test-Path "HKLM:\$appPath") {
  Write-Host "Removing App Path registration..."
  Remove-Item -Force "HKLM:\$appPath"
}
if (Test-Path "HKCU:\$appPath") {
  Write-Host "Removing User App Path registration..."
  Remove-Item -Force "HKCU:\$appPath"
}
