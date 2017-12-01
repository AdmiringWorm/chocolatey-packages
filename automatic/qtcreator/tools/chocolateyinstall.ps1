. "$PSScriptRoot\common.ps1"

$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://download.qt.io/official_releases/qtcreator/{0}/{1}/installer_source/windows_vs2013_32/qtcreator.7z" -f $packageVersionMinor, $packageVersionPatch
$checksum = 'e0d6f76bc5babd77894e6d0defc42f5b'
$checksumType = 'md5'
$unzipLocation = Join-Path "$(Get-ToolsLocation)" $packageName
$qtcreatorExe = Join-Path $toolsDir "bin\qtcreator.exe"

Install-ChocolateyZipPackage $packageName $url $toolsDir -checksum $checksum -checksumType $checksumType

# generate ignore files, to avoid excessive shims
$files = get-childitem $toolsDir -include *.exe -exclude qtcreator.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

Install-ChocolateyShortcut -shortcutFilePath $shortcutFile -targetPath $qtcreatorExe
Install-ChocolateyFileAssociation ".pro" $qtcreatorExe
