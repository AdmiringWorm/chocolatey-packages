$ErrorActionPreference = 'Stop'

$runningProcess = Get-Process -Name "sheepit*"
if ($runningProcess) {
  throw "The SheepIt client is running, please close it before removing the program."
}

$toolsDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
$paths = @{
  "$toolsDir" = "tools directory"
  "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\sheepit.exe" = "App Path registration"
  "$([System.Environment]::GetFolderPath('CommonStartMenu'))\SheepIt Client.lnk" = "Start Menu Shortcut"
  "$([System.Environment]::GetFolderPath('CommonDesktopDirectory'))\SheepIt Client.lnk" = "Desktop Shortcut"
}

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path $_.Key) {
    Write-Host "Removing $env:ChocolateyPackageName $($_.Value)..."
    Remove-Item -Recurse -Force $_.Key
  }
}
