$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$exe = "$toolsPath\"

$pp = Get-PackageParameters

if ($pp.Desktop) {
  Write-Host "Creating desktop shortcut for ReShade..."
  # Create desktop shortcut
  # Note: While PSHv2 doesn't support CommonDesktopDirectory, it can still be used since choco targets .NET 4.0
  $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
  Install-ChocolateyShortcut -ShortcutFilePath "$desktop\ReShade.lnk" -TargetPath $exe
}

if (!$pp.NoStartMenu) {
  Write-Host "Creating Start Menu shortcut for ReShade..."
  # Create start menu shortcut
  # Note: While POSHv2 doesn't support CommonStartMenu, it can still be used since choco targets .NET 4.0
  $startMenu = [System.Environment]::GetFolderPath('CommonStartMenu')
  Install-ChocolateyShortcut -ShortcutFilePath "$startMenu\ReShade.lnk" -TargetPath $exe
}
