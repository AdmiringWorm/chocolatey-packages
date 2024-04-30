$ErrorActionPreference = 'Stop';

$startMenu = [System.Environment]::GetFolderPath("Programs")
$desktop   = [System.Environment]::GetFolderPath('Desktop')
$linkName = "tinyMediaManager.lnk"

Uninstall-BinFile tinyMediaManagerCMD

if (Test-Path "$startMenu\$linkName") {
  Write-Host "Removing Start Menu Icon"
  Remove-Item "$startMenu\$linkName"
}
if (Test-Path "$desktop\$linkName") {
  Write-Host "Removing Desktop Icon"
  Remove-Item "$desktop\$linkName"
}

$installPath = "$(Get-ToolsLocation)\tinyMediaManager"

if (Test-Path $installPath) {
  Write-Host "Removing installed files."
  Remove-Item $installPath -Recurse -Force
}
