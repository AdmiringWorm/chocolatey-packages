$ErrorActionPreference = 'Stop';

Write-Host "Cleaning up leftover from old packages"

$linkName = 'tinyMediaManager.lnk'
$publicDesktop = "${env:Public}\Desktop\$linkName"
$publicStartMenu = "${env:ProgramData}\Microsoft\Windows\Start Menu\Programs\$linkName"

if (Test-Path $publicDesktop) {
  Remove-Item $publicDesktop -EA 0
}

if (Test-Path $publicStartMenu) {
  Remove-Item $publicStartMenu -EA 0
}

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$destination = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  file64         = "$toolsDir\tinyMediaManager-5.0.9-windows-amd64.zip"
  SpecificFolder = 'tinyMediaManager'
  Destination    = $destination
}

Get-ChocolateyUnzip @packageArgs

$destination = "$destination\tinyMediaManager"
$env:ChocolateyPackageInstallLocation = $destination

$guiTarget = "$destination\tinyMediaManager.exe"
$cmdTarget = "$destination\tinyMediaManagerCMD.exe"

$startMenu = [System.Environment]::GetFolderPath('Programs')
Install-ChocolateyShortcut -ShortcutFilePath "$startMenu\$linkName" -TargetPath "$guiTarget"
$desktop = [System.Environment]::GetFolderPath('Desktop')
Install-ChocolateyShortcut -ShortcutFilePath "$desktop\$linkName" -TargetPath $guiTarget

Install-BinFile -Name "tinyMediaManagerCMD" -Path $cmdTarget

Remove-Item $packageArgs.file64 -Force
