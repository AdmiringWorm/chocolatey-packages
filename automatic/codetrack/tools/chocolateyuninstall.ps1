$ErrorActionPreference = 'Stop'

$startMenu = [System.Environment]::GetFolderPath('Programs')
if (Test-Path "$startMenu\CodeTrack.lnk") {
  Write-Host "Removing $env:chocolateyPackageName start menu icon..."
  Remove-Item -Force "$startMenu\CodeTrack.lnk"
}

$regKey ="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\$env:chocolateyPackageName.exe"
if (Test-Path $regKey) {
  Write-Host "Removing registered $env:chocolateyPackageName app path..."
  Remove-Item $regKey -Force -ea 0
}
