$ErrorActionPreference = 'Stop'

$regKey ="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\$($env:chocolateyPackageName).exe"
if (Test-Path $regKey) {
  Remove-Item $regKey -Force -ea 0
  Write-Host "Removing registered $($env:chocolateyPackageName) app path..."
}
