$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  file           = "$toolsPath\teeworlds-0.6.5-win32.zip"
  destination    = "$toolsPath"
}

Get-ChocolateyUnzip @packageArgs

Remove-Item $packageArgs.file -Force

$gameFile = Get-ChildItem $toolsPath "teeworlds.exe" -Recurse | ForEach-Object { $_.FullName }
$serverFile = Get-ChildItem $toolsPath "teeworlds_srv.exe" -Recurse | ForEach-Object { $_.FullName }

$pp = Get-PackageParameters

if ($pp.Desktop) {
  Write-Host "Creating desktop shortcut for Teeworlds game"
  # Create desktop shortcut
  # Note: While PSHv2 doesn't support CommonDesktopDirectory, it can still be used since choco targets .NET 4.0
  $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
  Install-ChocolateyShortcut -ShortcutFilePath "$desktop\Teeworlds.lnk" -TargetPath $gameFile

  Write-Host "Creating desktop shortcut for Teeworlds server"
  Install-ChocolateyShortcut -ShortcutFilePath "$desktop\Teeworlds Server.lnk" -TargetPath $serverFile
}

if (!($pp.NoStartMenu)) {
  Write-Host "Creating Start Menu shortcut for Teeworlds game..."
  # Create start menu shortcut
  # Note: While POSHv2 doesn't support CommonStartMenu, it can still be used since choco targets .NET 4.0
  $startMenu = [System.Environment]::GetFolderPath('CommonStartMenu')
  Install-ChocolateyShortcut -ShortcutFilePath "$startMenu\Teeworlds.lnk" -TargetPath $gameFile

  Write-Host "Creating Start Menu shortcut for Teeworlds server..."
  Install-ChocolateyShortcut -ShortcutFilePath "$startMenu\Teeworlds Server.lnk" -TargetPath $serverFile
}
