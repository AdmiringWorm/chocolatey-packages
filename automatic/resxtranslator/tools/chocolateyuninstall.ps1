$ErrorActionPreference = 'Stop';

$startMenu = [System.Environment]::GetFolderPath("Programs")
$desktop   = [System.Environment]::GetFolderPath('Desktop')
$linkName = "Resx Resource Translator.lnk"

if (Test-Path "$startMenu\$linkName") {
  write-Host "Removing Start Menu Icon"
  Remove-Item "$startMenu\$linkName"
}
if (Test-Path "$desktop\$linkName") {
  Write-Host "Removing Desktop Icon"
  Remove-Item "$desktop\$linkName"
}
