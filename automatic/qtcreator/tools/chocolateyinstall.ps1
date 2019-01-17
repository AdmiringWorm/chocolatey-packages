$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.8/4.8.1/installer_source/windows_vs2015_32/qtcreator.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.8/4.8.1/installer_source/windows_vs2015_64/qtcreator.7z'
  destination    = "$installToolsPath\$env:ChocolateyPackageName"
  checksum       = 'fead139e018b334870e4b16e7f1abfef03de6f97bbf290e6ace0d90bf6296577'
  checksumType   = 'sha256'
  checksum64     = 'b75cba2ff9bbbf70b8d2f2a6a0575563bb6fb5770635bd3217a6aabd3ca73dae'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$qtCreator = $null

Get-ChildItem $packageArgs.destination -Include "*.exe" -Recurse | ForEach-Object {
  if ($_.Name -eq "qtcreator.exe") {
    Set-Content -Value "" -LiteralPath "$($_.FullName).gui"
    $qtCreator = $_.FullName
  }
  else {
    Set-Content -Value "" -LiteralPath "$($_.FullName).ignore"
  }
}

if ($qtCreator) {
  # Because chocolatey targets 4.0, we are able to use 'Programs' in the 'GetFolderPath'
  $programs = [System.Environment]::GetFolderPath("Programs")
  Install-ChocolateyShortcut -shortcutFile "$programs\QT Creator.lnk" -targetPath $qtCreator
  Install-ChocolateyFileAssociation ".pro" $qtCreator
} else {
  Write-Warning "Unable to find qtcreator executable, skipping start menu shortcut creation!"
}
