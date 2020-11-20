$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.13/4.13.3/installer_source/windows_x86/qtcreator.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.13/4.13.3/installer_source/windows_x64/qtcreator.7z'
  destination    = "$installToolsPath\$env:ChocolateyPackageName"
  checksum       = '641f68f2d60ab57d6e3f48c14fd2e1b52338bf11ce5dd5e94fa39adbe6528638'
  checksumType   = 'sha256'
  checksum64     = '189e18125b277a95f5ee28a41193b89a858444025477ff5c28c2986e30b0b438'
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
