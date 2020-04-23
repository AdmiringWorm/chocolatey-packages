$ErrorActionPreference = 'Stop'

$installToolsPath = Get-ToolsLocation

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.qt.io/official_releases/qtcreator/4.12/4.12.0/installer_source/windows_msvc2017_x86/qtcreator.7z'
  url64bit       = 'https://download.qt.io/official_releases/qtcreator/4.12/4.12.0/installer_source/windows_msvc2017_x64/qtcreator.7z'
  destination    = "$installToolsPath\$env:ChocolateyPackageName"
  checksum       = '670d638daed00c61cdce6586fb0e1ce513a91eaa97885185667a794699fbc355'
  checksumType   = 'sha256'
  checksum64     = 'c4ed88633b0e4e3c7e7ff4935e213a94ddead7dc4b92f464750cb915a90af085'
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
