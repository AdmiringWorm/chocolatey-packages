$ErrorActionPreference = 'Stop';

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filePath = "$toolsPath\ResxTranslator_v2.3_release_signed.zip"
$packageArgs = @{
  packageName    = 'resxtranslator'
  fileType       = 'zip'
  file           = $filePath
  destination    = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

$pp = Get-PackageParameters

$linkName = "Resx Resource Translator.lnk"
if (!$pp.NoStartMenuIcon) {
  Write-Host "Creating Start Menu Icon"
  $startMenu = [System.Environment]::GetFolderPath('Programs')
  $path = "$startMenu\$linkName"
  Install-ChocolateyShortcut -ShortcutFilePath $path -TargetPath "$toolsPath\resxtranslator.exe"
}
if ($pp.CreateDesktopIcon) {
  Write-Host "Creating Desktop Icon"
  $desktop = [System.Environment]::GetFolderPath('Desktop')
  $path = "$desktop\$linkName"
  Install-ChocolateyShortcut -ShortcutFilePath $path -TargetPath "$toolsPath\resxtranslator.exe"
}

Remove-Item $packageArgs.file -Force

Get-ChildItem $toolsPath -Filter "*.exe" | % {
  New-Item "$($_.FullName).gui" -ItemType File
}
