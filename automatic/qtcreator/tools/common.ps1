$productName = 'Qt Creator'
$packageName = "$env:chocolateyPackageName"
$packageVersionMinor = "4.1"
$packageVersionPatch = "$env:chocolateyPackageVersion"

$shortcutName = "$productName $packageVersionPatch (Chocolatey).lnk"
$shortcutDir = [environment]::getfolderpath('Programs')
$shortcutDir = Join-Path $shortcutDir $productName
$shortcutFile = Join-Path $shortcutDir $shortcutName
