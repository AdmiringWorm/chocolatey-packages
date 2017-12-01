$packageName    = "uplay"
$installerType  = "EXE"
$url            = "https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe"
$silentArgs     = '/S /NCRC'


Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"